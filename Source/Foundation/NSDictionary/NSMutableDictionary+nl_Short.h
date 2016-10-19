//
//  NSMutableDictionary+nl_Short.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (nl_Short)

-(void)nl_setString:(NSString*)i forKey:(NSString*)key;

-(void)nl_setBool:(BOOL)i forKey:(NSString*)key;

-(void)nl_setInt:(int)i forKey:(NSString*)key;

-(void)nl_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)nl_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)nl_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)nl_setChar:(char)c forKey:(NSString*)key;

-(void)nl_setFloat:(float)i forKey:(NSString*)key;

-(void)nl_setDouble:(double)i forKey:(NSString*)key;

-(void)nl_setLongLong:(long long)i forKey:(NSString*)key;

-(void)nl_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)nl_setSize:(CGSize)o forKey:(NSString*)key;

-(void)nl_setRect:(CGRect)o forKey:(NSString*)key;

@end
