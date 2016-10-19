//
//  NSObject+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/22.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSObject+nl_Kit.h"
#import <objc/runtime.h>

@implementation NSObject (nl_Kit)

+ (NSUInteger)nl_sizeInstance {
  return class_getInstanceSize(self);
}

- (NSUInteger)nl_sizeInstance {
  return [[self class] nl_sizeInstance];
}

+ (BOOL)nl_swizzleMethod:(SEL)selector withMethod:(SEL)otherSelector {
  Class class = [self class];
  
  Method originalMethod = class_getInstanceMethod(class, selector);
  Method otherMethod = class_getInstanceMethod(class, otherSelector);
  
  if (originalMethod == nil || otherMethod == nil) {
    return NO;
  }
  
  method_exchangeImplementations(originalMethod, otherMethod);
  
  return YES;
}

+ (BOOL)nl_swizzleClassMethod:(SEL)selector withMethod:(SEL)otherSelector {
  Class class = [self class];
  
  Method originalMethod = class_getClassMethod(class, selector);
  Method otherMethod = class_getClassMethod(class, otherSelector);
  
  if (originalMethod == nil || otherMethod == nil) {
    return NO;
  }
  
  method_exchangeImplementations(originalMethod, otherMethod);
  
  return YES;
}

@end
