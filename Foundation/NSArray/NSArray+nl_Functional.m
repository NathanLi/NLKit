//
//  NSArray+nl_Functional.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/18.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSArray+nl_Functional.h"

@implementation NSArray (nl_Functional)

- (NSArray *)nl_map:(id(^)(id object))block {
  NSParameterAssert(block != nil);
  
  if (block == nil) return nil;
  
  NSMutableArray *maps = [NSMutableArray arrayWithCapacity:[self count]];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    id result = block(obj);
    if (result) {
      [maps addObject:result];
    } else {
      [maps addObject:[NSNull null]];
    }
  }];
  return [maps count] > 0 ? maps : nil;
}

- (NSArray *)nl_filter:(BOOL(^)(id object))block {
  NSParameterAssert(block != nil);
  
  if (block == nil) return nil;
  NSMutableArray *filters = [NSMutableArray arrayWithCapacity:[self count]];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if (block(obj)) {
      [filters addObject:obj];
    }
  }];
  
  return [filters count] > 0 ? filters : nil;
}


- (id)nl_reduce:(id)initValue combine:(id (^)(id value, id each))combineBlock {
  __block id result = initValue;
  
  if (combineBlock) {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      result = combineBlock(result, obj);
    }];
  }
  
  return result;
}

- (NSArray *)nl_reverse {
  NSMutableArray *reverses = [NSMutableArray arrayWithCapacity:[self count]];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];
  
  id object = [enumerator nextObject];
  while (object) {
    [reverses addObject:object];
    object = [enumerator nextObject];
  }
  
  return reverses;
}

@end
