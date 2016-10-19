//
//  UITextField+NLLimit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-25.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITextField+NLLimit.h"
#import <objc/runtime.h>

@implementation UITextField (NLLimit)

static void *nlLimitMaxLengthKey = &nlLimitMaxLengthKey;

- (void)setNl_maxLength:(NSUInteger)nl_maxLength {
  objc_setAssociatedObject(self, nlLimitMaxLengthKey, @(nl_maxLength), OBJC_ASSOCIATION_COPY);
  
  if (nl_maxLength > 0) {
    [self addTarget:self action:@selector(_nl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  } else {
    [self removeTarget:self action:@selector(_nl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  }
}

- (NSUInteger)nl_maxLength {
  return [objc_getAssociatedObject(self, nlLimitMaxLengthKey) unsignedIntegerValue];
}

#pragma mark - private
- (void)_nl_valueChanged:(UITextField *)textField {
  if (self.nl_maxLength == 0) {
    return;
  }
  
  NSUInteger currentLength = [textField.text length];
  if (currentLength <= self.nl_maxLength) {
    return;
  }
  
  NSString *subString = [textField.text substringToIndex:self.nl_maxLength];
  dispatch_async(dispatch_get_main_queue(), ^{
    textField.text = subString;
    [textField sendActionsForControlEvents:UIControlEventEditingChanged];
  });
}



@end
