//
//  NSDictionary+nl_Short.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (nl_Short)

- (long)nl_longForKey:(NSString *)key;
- (int)nl_intForKey:(NSString *)key;

- (NSString*)nl_stringForKey:(id)key;

- (NSNumber*)nl_numberForKey:(id)key;

- (NSArray*)nl_arrayForKey:(id)key;

- (NSDictionary*)nl_dictionaryForKey:(id)key;

- (NSInteger)nl_integerForKey:(id)key;

- (NSUInteger)nl_unsignedIntegerForKey:(id)key;

- (BOOL)nl_boolForKey:(id)key;

- (int16_t)nl_int16ForKey:(id)key;

- (int32_t)nl_int32ForKey:(id)key;

- (int64_t)nl_int64ForKey:(id)key;

- (char)nl_charForKey:(id)key;

- (short)nl_shortForKey:(id)key;

- (float)nl_floatForKey:(id)key;

- (double)nl_doubleForKey:(id)key;

- (long long)nl_longLongForKey:(id)key;

- (unsigned long long)nl_unsignedLongLongForKey:(id)key;

//CG
- (CGFloat)nl_CGFloatForKey:(id)key;

- (CGPoint)nl_pointForKey:(id)key;

- (CGSize)nl_sizeForKey:(id)key;

- (CGRect)nl_rectForKey:(id)key;
@end
