//
//  NSData+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/7/3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (nl_Kit)

/**
 *  @brief  是否是gif数据
 *
 *  @return 如果是gif图片数据则返回YES，否则返回NO
 */
- (BOOL)nl_isGifData;

- (NSString *)nl_base64ToString;

@end
