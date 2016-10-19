//
//  NSArray+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/22.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSArray+nl_Kit.h"
#import "NSObject+nl_Kit.h"

@implementation NSArray (nl_Kit)

- (id)nl_safetyObjectAtIndex:(NSUInteger)index {
  if (index < [self count]) {
    return [self objectAtIndex:index];
  }
  
  return nil;
}

- (instancetype)nl_arrayByAddUniqueArray:(NSArray *)array {
  NSMutableArray *result = [NSMutableArray arrayWithArray:self];
  for (id obj in array) {
    if ([result containsObject:obj]) continue;
    [result addObject:obj];
  }
  
  return result;
}

- (BOOL)nl_isEmpty {
  return [self count] == 0;
}

- (NSUInteger)nl_sizeAllObjects {
  __block NSUInteger size = 0;

  for (NSUInteger index = 0; index < [self count]; ++index) {
    id obj = self[index];
    size += [obj nl_sizeInstance];
  }
  
  return size;
}

@end
