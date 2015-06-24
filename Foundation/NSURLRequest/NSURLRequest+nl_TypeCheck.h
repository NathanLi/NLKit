//
//  NSURLRequest+nl_TypeCheck.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (nl_TypeCheck)

- (BOOL)nl_isTel;
- (BOOL)nl_isSms;
- (BOOL)nl_isMail;

@end
