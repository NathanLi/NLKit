//
//  NSArray+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/22.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+nl_Functional.h"

@interface NSArray (nl_Kit)

- (id)nl_safetyObjectAtIndex:(NSUInteger)index;
- (instancetype)nl_arrayByAddUniqueArray:(NSArray *)array;
- (BOOL)nl_isEmpty;

/**
 *  @brief  Returns the size of all instances of the array.
 *
 *  @return The size in bytes of all instances of the array.
 */
- (NSUInteger)nl_sizeAllObjects;

@end
