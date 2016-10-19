//
//  UITextView+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/29.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITextView+nl_Kit.h"
#import <objc/runtime.h>
#import "NLInputAccessoryView.h"

@implementation UITextView (nl_Kit)

@end


@implementation UITextView (nl_inputAccessoryView)

- (void)setNl_nextFirstResponder:(UIResponder *)nl_nextFirstResponder {
  objc_setAssociatedObject(self, sel_getName(@selector(nl_nextFirstResponder)), nl_nextFirstResponder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if ([nl_nextFirstResponder respondsToSelector:@selector(nl_lastFirstResponder)]
      && ![nl_nextFirstResponder performSelector:@selector(nl_lastFirstResponder)]) {
    if ([nl_nextFirstResponder respondsToSelector:@selector(setNl_lastFirstResponder:)]) {
      [nl_nextFirstResponder performSelector:@selector(setNl_lastFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)nl_nextFirstResponder {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setNl_lastFirstResponder:(UIResponder *)nl_lastFirstResponder {
  objc_setAssociatedObject(self, sel_getName(@selector(nl_lastFirstResponder)), nl_lastFirstResponder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if ([nl_lastFirstResponder respondsToSelector:@selector(nl_nextFirstResponder)]
      && ![nl_lastFirstResponder performSelector:@selector(nl_nextFirstResponder)]) {
    if ([nl_lastFirstResponder respondsToSelector:@selector(setNl_nextFirstResponder:)]) {
      [nl_lastFirstResponder performSelector:@selector(setNl_nextFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)nl_lastFirstResponder {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setNl_showInputAccessoryView:(BOOL)nl_showInputAccessoryView {
  objc_setAssociatedObject(self, @selector(nl_showInputAccessoryView), @(nl_showInputAccessoryView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if (nl_showInputAccessoryView) {
    self.inputAccessoryView = [[NLInputAccessoryView alloc] initWithTargert:self last:self.nl_lastFirstResponder next:self.nl_nextFirstResponder doneBlock:nil];
  } else {
    self.inputAccessoryView = nil;
  }
}

- (BOOL)nl_showInputAccessoryView {
  return [objc_getAssociatedObject(self, _cmd) boolValue];
}




@end