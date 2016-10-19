//
//  NSObject+CodingSupport.m
//  jobsradar
//
//  Created by Nathan Li on 14-7-15.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "NSObject+CodingSupport.h"
#import "NSObject+Reflex.h"
#import <objc/runtime.h>

@implementation NSObject (CodingSupport)

- (void)encodeWithCoder:(NSCoder *)aCoder {
  NSArray *properties = [[self class] propertyKeys];
  [properties enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
    id value = [self valueForKey:key];
    [aCoder encodeObject:value forKey:key];
  }];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if ([self init]) {
    NSArray *properties = [[self class] propertyKeys];
    [properties enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
      id value = [aDecoder decodeObjectForKey:key];
      if (value) {
        [self setValue:value forKey:key];
      }
    }];
  }
  return self;
}

@end
