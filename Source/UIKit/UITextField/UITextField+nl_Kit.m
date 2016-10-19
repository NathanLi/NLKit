//
//  UITextField+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/29.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITextField+nl_Kit.h"
#import <objc/runtime.h>
#import "NLInputAccessoryView.h"
#import "NSObject+nl_Kit.h"

@implementation UITextField (nl_Kit)


+ (void)load {
  Method textRectForBounds = class_getInstanceMethod(self, @selector(textRectForBounds:));
  Method nl_textRectForBounds = class_getInstanceMethod(self, @selector(_nl_textRectForBounds:));
  
  Method editingRectForBounds = class_getInstanceMethod(self, @selector(editingRectForBounds:));
  Method nl_editingRectForBounds = class_getInstanceMethod(self, @selector(_nl_editingRectForBounds:));
  
  if (textRectForBounds && nl_textRectForBounds && editingRectForBounds && nl_editingRectForBounds) {
    method_exchangeImplementations(textRectForBounds, nl_textRectForBounds);
    method_exchangeImplementations(editingRectForBounds, nl_editingRectForBounds);
  }
}

- (CGRect (^)(CGRect))nl_textRectForBoundsBlock {
  return [self nl_associatedValueForKey:_cmd];
}

- (void)setNl_textRectForBoundsBlock:(CGRect (^)(CGRect))nl_textRectForBoundsBlock {
  [self nl_setAssociateCopyValue:nl_textRectForBoundsBlock withKey:@selector(nl_textRectForBoundsBlock)];
}

- (CGRect)_nl_textRectForBounds:(CGRect)bounds {
  if (self.nl_textRectForBoundsBlock) {
    return self.nl_textRectForBoundsBlock(bounds);
  }
  
  return [self _nl_textRectForBounds:bounds];
}

- (CGRect)_nl_editingRectForBounds:(CGRect)bounds {
  if (self.nl_textRectForBoundsBlock) {
    return self.nl_textRectForBoundsBlock(bounds);
  }
  
  return [self _nl_editingRectForBounds:bounds];
}

+ (instancetype _Nonnull)nl_textField:(void (^_Nullable)(UITextField *_Nonnull))block {
  UITextField *textFiled = [[self alloc] initWithFrame:CGRectZero];
  if (block) {
    block(textFiled);
  }
  return textFiled;
}

@end


@interface NLUITextFieldKitService : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) UIResponder *lastFirstResponder;
@property (nonatomic, weak) UIResponder *nextFirstResponder;
@property (nonatomic, copy) void (^returnKeyBlock)(void);

@end

@implementation NLUITextFieldKitService

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  BOOL result = YES;
  
  if (self.nextFirstResponder && [self.nextFirstResponder canBecomeFirstResponder]) {
    [self.nextFirstResponder becomeFirstResponder];
    result = NO;
  }
  
  if (self.returnKeyBlock) {
    self.returnKeyBlock();
    return NO;
  }
  
  if (result == YES && [textField canResignFirstResponder]) {
    [textField resignFirstResponder];
    return NO;
  }
  
  return result;
}

@end

@implementation UITextField (nl_textFieldDelegate)

- (void)nl_returnKeyBlock:(void (^)(void))returnKeyBlock {
  [self setupKitService];
  
  NLUITextFieldKitService *service = [self nl_kitService];
  service.returnKeyBlock = returnKeyBlock;
}

- (void)setNl_nextFirstResponder:(id)nl_nextFirstResponder {
  if (nl_nextFirstResponder) {
    self.returnKeyType = UIReturnKeyNext;
  } else {
    self.returnKeyType = UIReturnKeyDone;
  }
  
  [self setupKitService];
  
  NLUITextFieldKitService *service = [self nl_kitService];
  [service setNextFirstResponder:nl_nextFirstResponder];
  
  if ([nl_nextFirstResponder respondsToSelector:@selector(nl_lastFirstResponder)]
      && !([nl_nextFirstResponder performSelector:@selector(nl_lastFirstResponder)])) {
    if ([nl_nextFirstResponder respondsToSelector:@selector(setNl_lastFirstResponder:)]) {
      [nl_nextFirstResponder performSelector:@selector(setNl_lastFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)nl_nextFirstResponder {
  return [[self nl_kitService] nextFirstResponder];
}

- (void)setupKitService {
  NLUITextFieldKitService *service = [self nl_kitService];
  if (!service) {
    service = [[NLUITextFieldKitService alloc] init];
    [self setNl_kitService:service];
  }
  
  self.delegate = service;
}

static void *nl_returnKeyServiceKey = &nl_returnKeyServiceKey;
- (void)setNl_kitService:(NLUITextFieldKitService *)service {
  objc_setAssociatedObject(self, nl_returnKeyServiceKey, service, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NLUITextFieldKitService *)nl_kitService {
  return objc_getAssociatedObject(self, nl_returnKeyServiceKey);
}

@end

@implementation UITextField (nl_inputAccessoryView)

- (void)setNl_lastFirstResponder:(UIResponder *)nl_lastFirstResponder {
  id delegate = self.delegate;
  [self setupKitService];
  if (delegate) {
    self.delegate = delegate;
  }
  
  NLUITextFieldKitService *service = [self nl_kitService];
  service.lastFirstResponder = nl_lastFirstResponder;
  
  if ([nl_lastFirstResponder respondsToSelector:@selector(nl_nextFirstResponder)]
      && !([nl_lastFirstResponder performSelector:@selector(nl_nextFirstResponder)])) {
    if ([nl_lastFirstResponder respondsToSelector:@selector(setNl_nextFirstResponder:)]) {
      [nl_lastFirstResponder performSelector:@selector(setNl_nextFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)nl_lastFirstResponder {
  return [self nl_kitService].lastFirstResponder;
}

static void *nl_showInputAccessoryViewKey = &nl_showInputAccessoryViewKey;
- (void)setNl_showInputAccessoryView:(BOOL)nl_showInputAccessoryView {
  objc_setAssociatedObject(self, nl_showInputAccessoryViewKey, @(nl_showInputAccessoryView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if (nl_showInputAccessoryView) {
    self.inputAccessoryView = [[NLInputAccessoryView alloc] initWithTargert:self last:self.nl_lastFirstResponder next:self.nl_nextFirstResponder doneBlock:nil];
  } else {
    self.inputAccessoryView = nil;
  }
}

- (BOOL)nl_showInputAccessoryView {
  return [objc_getAssociatedObject(self, nl_showInputAccessoryViewKey) boolValue];
}

@end
