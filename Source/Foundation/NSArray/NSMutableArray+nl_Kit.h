//
//  NSMutableArray+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/6/29.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (nl_Kit)

- (BOOL)nl_addObject:(id)object;

- (BOOL)nl_addUniqueObject:(id)object;
- (NSUInteger)nl_addUniqueArray:(NSArray *)array;

@end
