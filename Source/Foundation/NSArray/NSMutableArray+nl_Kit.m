//
//  NSMutableArray+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/6/29.
//  Copyright (c) 2015年 Hoomcic. All rights reserved.
//

#import "NSMutableArray+nl_Kit.h"

@implementation NSMutableArray (nl_Kit)

- (NSUInteger)nl_addUniqueArray:(NSArray *)array {
  if (array == nil) {
    return 0;
  }
  
  NSUInteger originCount = [self count];
  [self removeObjectsInArray:array];
  [self addObjectsFromArray:array];
  
  NSUInteger nowCount = [self count];
  
  return nowCount - originCount;
}

- (BOOL)nl_addUniqueObject:(id)object {
  if ([self containsObject:object]) {
    return NO;
  }

  return [self nl_addObject:object];
}

- (BOOL)nl_addObject:(id)object {
  if (object) {
    [self addObject:object];
    return YES;
  }
  return NO;
}

@end
