//
//  NSDictionary+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDictionary+nl_Short.h"
#import "NSMutableDictionary+nl_Short.h"

@interface NSDictionary (nl_Kit)

- (BOOL)nl_hasKey:(NSString *)key;

/**
 *  @brief  Returns a Boolean value that indicates whether a given object is present in the dictionary as a value.
 *       This method determines whether anObject is present in the values array by sending an isEqual: message to each
 *       of the array’s objects (and passing anObject as the parameter to each isEqual: message).
 *
 *  @param value An object
 *
 *  @return YES if anObject is present in the dictionary as a value, otherwise NO.
 */
- (BOOL)nl_containsValue:(NSString *)value;

/**
 *  @brief  Returns the size of all instances of the dictionary keys.
 *
 *  @return The size in bytes of all instances of the dictionary keys.
 */
- (NSUInteger)nl_sizeAllKeys;

/**
 *  @brief  Returns the size of all instances of the dictionary values.
 *
 *  @return The size in bytes of all instances of the dictionary values.
 */
- (NSUInteger)nl_sizeAllValues;

/**
 *  @brief  Returns the size of all instances of the dictionary keys and values.
 *       eq: [self nl_sizeAllKeys] + [self nl_sizeAllValues]
 *
 *  @return The size in bytes of all instances of the dictionary keys and values.
 */
- (NSUInteger)nl_sizeAllObjects;

@end


@interface NSMutableDictionary (nl_SafeAccessory)

- (BOOL)nl_setObject:(id)object forKey:(NSString *)key;

@end