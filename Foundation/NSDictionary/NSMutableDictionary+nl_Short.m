//
//  NSMutableDictionary+nl_Short.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSMutableDictionary+nl_Short.h"
#import "NSDictionary+nl_Kit.h"

@implementation NSMutableDictionary (nl_Short)

-(void)nl_setString:(NSString*)i forKey:(NSString*)key
{
  [self nl_setObject:i forKey:key];
}

-(void)nl_setBool:(BOOL)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)nl_setInt:(int)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)nl_setInteger:(NSInteger)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)nl_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)nl_setCGFloat:(CGFloat)f forKey:(NSString *)key
{
  self[key] = @(f);
}
-(void)nl_setChar:(char)c forKey:(NSString *)key
{
  self[key] = @(c);
}
-(void)nl_setFloat:(float)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)nl_setDouble:(double)i forKey:(NSString*)key{
  self[key] = @(i);
}
-(void)nl_setLongLong:(long long)i forKey:(NSString*)key{
  self[key] = @(i);
}
-(void)nl_setPoint:(CGPoint)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGPoint(o);
}
-(void)nl_setSize:(CGSize)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGSize(o);
}
-(void)nl_setRect:(CGRect)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGRect(o);
}

@end
