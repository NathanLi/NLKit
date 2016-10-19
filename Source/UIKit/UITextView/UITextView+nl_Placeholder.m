//
//  UITextView+nl_PlaceHolder.m
//  ViewDemo
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITextView+nl_Placeholder.h"
#import <objc/runtime.h>

static NSString *const kHoomicNotificationDidChangeTextView = @"kHoomicNotificationDidChangeTextView";

@interface NLAutoPreferredMaxLayoutWidthLabel : UILabel

@end

@implementation NLAutoPreferredMaxLayoutWidthLabel

- (void)setBounds:(CGRect)bounds {
  [super setBounds:bounds];
  
  self.preferredMaxLayoutWidth = CGRectGetWidth(bounds);
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.preferredMaxLayoutWidth = MAX((CGRectGetWidth(self.superview.frame) - CGRectGetMinX(self.frame)), 0);
  
  /**
   *  @brief  第一次调用 [super layoutSubviews] 是为了获得 label 的 frame，而第二次调用是为了改变后更新布局。如果省略第二个调用我们可能会会得到一个 NSInternalInconsistencyException 的错误，因为我们改变了更新约束条件的布局操作，但我们并没有再次触发布局。
   */
  [super layoutSubviews];
}

@end

@interface NLTextViewPlaceholderHelper : NSObject

@property (nonatomic, weak) UITextView *textView;
- (instancetype)initWithTextView:(UITextView *)textView;

@end


@interface UITextView (nl_PlaceholderHelper)

@property (nonatomic, strong, readonly) UILabel *nl_lblPlaceholder;
@property (nonatomic, strong, readonly) NLTextViewPlaceholderHelper *nl_placeholderHelper;

@end


#pragma mark - nl_Placeholder
@implementation UITextView (nl_Placeholder)

+ (void)load {
  Method nl_setAttributedText = class_getInstanceMethod(self, @selector(nl_setAttributedText:));
  Method setAttributedText = class_getInstanceMethod(self, @selector(setAttributedText:));
  
  if (setAttributedText && nl_setAttributedText) {
    method_exchangeImplementations(nl_setAttributedText, setAttributedText);
  }
}

- (void)nl_setAttributedText:(NSAttributedString *)attributedText {
  [self nl_setAttributedText:attributedText];
  
  if (self.nl_isDidChangePostNotification) {
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self];
  } else {
    [[NSNotificationCenter defaultCenter] postNotificationName:kHoomicNotificationDidChangeTextView object:self];
  }
}

- (void)setNl_placeholderOrigin:(CGPoint)nl_placeholderOrigin {
  objc_setAssociatedObject(self, @selector(nl_placeholderOrigin), [NSValue valueWithCGPoint:nl_placeholderOrigin], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)nl_placeholderOrigin {
  NSValue *origin = objc_getAssociatedObject(self, _cmd);
  if (origin) {
    return [origin CGPointValue];
  }
  
  return CGPointMake(6.0, 7.5);
}

- (void)setNl_placeholder:(NSString *)nl_placeholder {
  [self.nl_lblPlaceholder setText:nl_placeholder];
  
  [self setNeedsDisplay];
}

- (NSString *)nl_placeholder {
  return [self.nl_lblPlaceholder text];
}

- (void)setNl_placeholderColor:(UIColor *)nl_placeholderColor {
  [self.nl_lblPlaceholder setTextColor:nl_placeholderColor];
}

- (UIColor *)nl_placeholderColor {
  return [self.nl_lblPlaceholder textColor];
}

- (void)setNl_placeholderFont:(UIFont *)nl_placeholderFont {
  [self.nl_lblPlaceholder setFont:nl_placeholderFont];
}

- (UIFont *)nl_placeholderFont {
  return [self.nl_lblPlaceholder font];
}

- (void)setNl_isDidChangePostNotification:(BOOL)nl_isDidChangePostNotification {
  objc_setAssociatedObject(self, @selector(nl_isDidChangePostNotification), @(nl_isDidChangePostNotification), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nl_isDidChangePostNotification {
  return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end

#pragma mark - nl_PlaceholderHelper
@implementation UITextView (nl_PlaceholderHelper)

- (UILabel *)nl_lblPlaceholder {
  if (!objc_getAssociatedObject(self, _cmd)) {
    UILabel *lblPlaceholder = [[NLAutoPreferredMaxLayoutWidthLabel alloc] init];
    [lblPlaceholder setTextColor:[UIColor colorWithWhite:0.789 alpha:1.0]];
    [lblPlaceholder setFont:[self font]];
    [lblPlaceholder setNumberOfLines:0];
    
    [self insertSubview:lblPlaceholder atIndex:0];
    
    lblPlaceholder.translatesAutoresizingMaskIntoConstraints = NO;
    NSString *visualV = [NSString stringWithFormat:@"V:|-%f-[lblPlaceholder]", self.nl_placeholderOrigin.y];
    NSArray *constraintVs = [NSLayoutConstraint constraintsWithVisualFormat:visualV options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblPlaceholder)];
    
    NSString *visualH = [NSString stringWithFormat:@"H:|-%f-[lblPlaceholder]-%f-|", self.nl_placeholderOrigin.x, self.nl_placeholderOrigin.x];
    NSArray *constraintHs = [NSLayoutConstraint constraintsWithVisualFormat:visualH options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblPlaceholder)];
    [self addConstraints:constraintHs];
    [self addConstraints:constraintVs];
    
    objc_setAssociatedObject(self, _cmd, lblPlaceholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if ([self.text length] > 0) {
      [lblPlaceholder setHidden:YES];
    }
    
    [self nl_placeholderHelper];
  }
  return objc_getAssociatedObject(self, _cmd);
}

- (NLTextViewPlaceholderHelper *)nl_placeholderHelper {
  if (!objc_getAssociatedObject(self, _cmd)) {
    NLTextViewPlaceholderHelper *helper = [[NLTextViewPlaceholderHelper alloc] initWithTextView:self];
    objc_setAssociatedObject(self, _cmd, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return objc_getAssociatedObject(self, _cmd);
}

@end


#pragma mark - NLTextViewPlaceholderHelper
@implementation NLTextViewPlaceholderHelper

- (void)didChange:(NSNotification *)notification {
  [self changePlaceholderHidden];
}

- (void)changePlaceholderHidden {
  self.textView.nl_lblPlaceholder.hidden = self.textView.text.length > 0;
}

- (instancetype)initWithTextView:(UITextView *)textView {
  {
    if (self = [super init]) {
      _textView = textView;
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UITextViewTextDidChangeNotification object:textView];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:kHoomicNotificationDidChangeTextView object:textView];
    }
    return self;
  }
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end