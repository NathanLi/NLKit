//
//  NSDictionary+nl_Short.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSDictionary+nl_Short.h"

@implementation NSDictionary (nl_Short)

- (long)nl_longForKey:(NSString *)key {
  id object = [self objectForKey:key];
  
  if ([object isKindOfClass:[NSNumber class]]) {
    return [object longValue];
  }
  
  if ([object isKindOfClass:[NSString class]]) {
    return (long)[((NSString *)object) longLongValue];
  }
  
  return 0;
}

- (int)nl_intForKey:(NSString *)key {
  id object = [self objectForKey:key];
  
  if ([object isKindOfClass:[NSNumber class]]) {
    return [object intValue];
  }
  
  if ([object isKindOfClass:[NSString class]]) {
    return [((NSString *)object) intValue];
  }
  
  return 0;
}

- (NSString*)nl_stringForKey:(id)key
{
  id value = [self objectForKey:key];
  if (value == nil || value == [NSNull null]) {
    return nil;
  }
  if ([value isKindOfClass:[NSString class]]) {
    return (NSString*)value;
  }
  if ([value isKindOfClass:[NSNumber class]]) {
    return [value stringValue];
  }
  
  return nil;
}

- (NSNumber*)nl_numberForKey:(id)key
{
  id value = [self objectForKey:key];
  if ([value isKindOfClass:[NSNumber class]]) {
    return (NSNumber*)value;
  }
  if ([value isKindOfClass:[NSString class]]) {
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    return [f numberFromString:(NSString*)value];
  }
  return nil;
}

- (NSArray*)nl_arrayForKey:(id)key
{
  id value = [self objectForKey:key];
  if (value == nil || value == [NSNull null])
  {
    return nil;
  }
  if ([value isKindOfClass:[NSArray class]])
  {
    return value;
  }
  return nil;
}

- (NSDictionary*)nl_dictionaryForKey:(id)key
{
  id value = [self objectForKey:key];
  if (value == nil || value == [NSNull null])
  {
    return nil;
  }
  if ([value isKindOfClass:[NSDictionary class]])
  {
    return value;
  }
  return nil;
}

- (NSInteger)nl_integerForKey:(id)key
{
  id value = [self objectForKey:key];
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
  {
    return [value integerValue];
  }
  return 0;
}
- (NSUInteger)nl_unsignedIntegerForKey:(id)key{
  id value = [self objectForKey:key];
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
  {
    return [value unsignedIntegerValue];
  }
  return 0;
}
- (BOOL)nl_boolForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return NO;
  }
  if ([value isKindOfClass:[NSNumber class]])
  {
    return [value boolValue];
  }
  if ([value isKindOfClass:[NSString class]])
  {
    return [value boolValue];
  }
  return NO;
}
- (int16_t)nl_int16ForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]])
  {
    return [value shortValue];
  }
  if ([value isKindOfClass:[NSString class]])
  {
    return [value intValue];
  }
  return 0;
}
- (int32_t)nl_int32ForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
  {
    return [value intValue];
  }
  return 0;
}
- (int64_t)nl_int64ForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
  {
    return [value longLongValue];
  }
  return 0;
}
- (char)nl_charForKey:(id)key{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
  {
    return [value charValue];
  }
  return 0;
}
- (short)nl_shortForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]])
  {
    return [value shortValue];
  }
  if ([value isKindOfClass:[NSString class]])
  {
    return [value intValue];
  }
  return 0;
}
- (float)nl_floatForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
  {
    return [value floatValue];
  }
  return 0;
}
- (double)nl_doubleForKey:(id)key
{
  id value = [self objectForKey:key];
  
  if (value == nil || value == [NSNull null])
  {
    return 0;
  }
  if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
  {
    return [value doubleValue];
  }
  return 0;
}
- (long long)nl_longLongForKey:(id)key
{
  id value = [self objectForKey:key];
  if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
    return [value longLongValue];
  }
  return 0;
}

- (unsigned long long)nl_unsignedLongLongForKey:(id)key
{
  id value = [self objectForKey:key];
  if ([value isKindOfClass:[NSString class]]) {
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    value = [nf numberFromString:value];
  }
  if ([value isKindOfClass:[NSNumber class]]) {
    return [value unsignedLongLongValue];
  }
  return 0;
}
//CG
- (CGFloat)nl_CGFloatForKey:(id)key
{
  CGFloat f = [self[key] doubleValue];
  return f;
}

- (CGPoint)nl_pointForKey:(id)key
{
  CGPoint point = CGPointFromString(self[key]);
  return point;
}
- (CGSize)nl_sizeForKey:(id)key
{
  CGSize size = CGSizeFromString(self[key]);
  return size;
}
- (CGRect)nl_rectForKey:(id)key
{
  CGRect rect = CGRectFromString(self[key]);
  return rect;
}


@end
