//
//  NSDictionary+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSDictionary+nl_Kit.h"
#import "NSArray+nl_Kit.h"

@implementation NSDictionary (nl_Kit)

- (BOOL)nl_hasKey:(NSString *)key {
  return [self objectForKey:key] != nil;
}

- (BOOL)nl_containsValue:(NSString *)value {
  return [[self allValues] containsObject:value];
}

/**
 *  @brief  Returns the size of all instances of the dictionary keys.
 *
 *  @return The size in bytes of all instances of the dictionary keys.
 */
- (NSUInteger)nl_sizeAllKeys {
  return [[self allKeys] nl_sizeAllObjects];
}

/**
 *  @brief  Returns the size of all instances of the dictionary values.
 *
 *  @return The size in bytes of all instances of the dictionary values.
 */
- (NSUInteger)nl_sizeAllValues {
  return [[self allValues] nl_sizeAllObjects];
}

/**
 *  @brief  Returns the size of all instances of the dictionary keys and values.
 *       eq: [self nl_sizeAllKeys] + [self nl_sizeAllValues]
 *
 *  @return The size in bytes of all instances of the dictionary keys and values.
 */
- (NSUInteger)nl_sizeAllObjects {
  return [self nl_sizeAllKeys] + [self nl_sizeAllValues];
}

@end

@implementation NSMutableDictionary (nl_SafeAccessory)

- (BOOL)nl_setObject:(id)object forKey:(NSString *)key {
  if (!object) return NO;
  
  [self setObject:object forKey:key];
  
  return YES;
}

@end
