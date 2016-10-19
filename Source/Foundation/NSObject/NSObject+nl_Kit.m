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

@end
