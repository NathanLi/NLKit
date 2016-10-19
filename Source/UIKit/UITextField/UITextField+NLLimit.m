//
//  UITextField+NLLimit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-25.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITextField+NLLimit.h"
#import <objc/runtime.h>

@interface NSString (nl_byteCount)
- (NSUInteger)nl_byteCount;
@end

@interface NLTextFiledDelegate : NSObject <UITextFieldDelegate>

@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, assign) NSUInteger maxBytes;
@property (nonatomic, weak) id<UITextFieldDelegate> realDelegate;

- (instancetype)initWithTextField:(UITextField *)textField;

@end

@implementation NLTextFiledDelegate

- (instancetype)initWithTextField:(UITextField *)textField {
  if (self = [super init]) {
    [textField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  }
  return self;
}

- (void)valueChanged:(UITextField *)textField {
  if (self.maxLength == 0 && self.maxBytes == 0) {
    return;
  }
  
  if (self.maxLength > 0) {
    NSUInteger currentLength = [textField.text length];
    if (currentLength <= self.maxLength) {
      return;
    }
  } else {// self.maxBytes > 0
    NSUInteger currentLength = [textField.text nl_byteCount];
    if (currentLength <= self.maxBytes) {
      return;
    }
  }
  
  void (^executeBlock)(void) = ^{
    NSUInteger markedLength = 0;
    if (textField.markedTextRange) {
      UITextRange *markedTextRange = textField.markedTextRange;
      UITextPosition *selectionStart = markedTextRange.start;
      UITextPosition *selectionEnd   = markedTextRange.end;
      
      markedLength = [textField offsetFromPosition:selectionStart toPosition:selectionEnd];
    }
    
    if (self.maxLength > 0) {
      if (markedLength > 0 && [textField.text length] == self.maxLength + 1) {
        return ;
      }
      
      NSString *subString = [textField.text substringToIndex:self.maxLength];
      textField.text = subString;
      
      [textField sendActionsForControlEvents:UIControlEventEditingChanged];
    } else {// self.maxBytes > 0
      if (markedLength > 0 && [textField.text nl_byteCount] == self.maxBytes + 1) {
        return ;
      }
    }
  };
  
  if ([NSThread isMainThread]) {
    executeBlock();
  } else {
    dispatch_async(dispatch_get_main_queue(), executeBlock);
  }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  if (self.maxLength > 0) {
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([str length] < [textField.text length]) {
      goto continueRealDelegate;
    }
    
    if ([str length] > self.maxLength) {
      return NO;
    }
  } else if (self.maxBytes > 0) {
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([str length] < [textField.text length]) {
      goto continueRealDelegate;
    }
    
    if ([str nl_byteCount] > self.maxBytes) {
      return NO;
    }
  }
  
  
continueRealDelegate:
  if ([self.realDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
    return [self.realDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
  }
  
  return YES;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
  if ([super respondsToSelector:aSelector]) {
    return YES;
  }
  
  return [self.realDelegate respondsToSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  SEL aSelector = [anInvocation selector];
  
  if ([self.realDelegate respondsToSelector:aSelector]) {
    [anInvocation invokeWithTarget:self.realDelegate];
  } else {
    [super forwardInvocation:anInvocation];
  }
}

@end

@implementation UITextField (NLLimit)

+ (void)load {
  Method methodSetDelegate = class_getInstanceMethod(self, @selector(setDelegate:));
  Method methodNLSetDelegate = class_getInstanceMethod(self, @selector(nl_setDelegate:));
  
  method_exchangeImplementations(methodSetDelegate, methodNLSetDelegate);
  
  Method methodDelegate = class_getInstanceMethod(self, @selector(delegate));
  Method methodNLDelegate = class_getInstanceMethod(self, @selector(nl_delegate));
  
  method_exchangeImplementations(methodDelegate, methodNLDelegate);
}

- (void)nl_setDelegate:(id<UITextFieldDelegate>)delegate {
  [self nl_proxyDelegate].realDelegate = delegate;
}

- (id<UITextFieldDelegate>)nl_delegate {
  return [self nl_proxyDelegate].realDelegate;
}

- (NLTextFiledDelegate *)nl_proxyDelegate {
  NLTextFiledDelegate *delegate = objc_getAssociatedObject(self, _cmd);
  if (delegate == nil) {
    @synchronized (self) {
      delegate = objc_getAssociatedObject(self, _cmd);
      
      if (delegate == nil) {
        delegate = [[NLTextFiledDelegate alloc] initWithTextField:self];
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self nl_setDelegate:[self nl_proxyDelegate]];
      }
    }
    
  }
  
  return delegate;
}

- (void)setNl_maxLength:(NSUInteger)nl_maxLength {
  [self nl_proxyDelegate].maxLength = nl_maxLength;
}

- (NSUInteger)nl_maxLength {
  return [self nl_proxyDelegate].maxLength;
}

- (void)setNl_maxBytes:(NSUInteger)nl_maxBytes {
  [self nl_proxyDelegate].maxBytes = nl_maxBytes;
}

- (NSUInteger)nl_maxBytes {
  return [self nl_proxyDelegate].maxBytes;
}



@end


@implementation NSString (nl_byteCount)

- (NSUInteger)nl_byteCount {
  NSUInteger count = 0;
  for (NSUInteger index = 0; index < [self length]; ++index) {
    UniChar c = [self characterAtIndex:index];
    if (c < 255) {
      count += 1;
    } else {
      count += 2;
    }
  }
  return count;
}

@end
