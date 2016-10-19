//
//  NSDate+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/7/28.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (nl_Kit)

+ (int)nl_ageWithDateOfBirth:(NSDate *)date;
+ (int)nl_ageWithDateOfBirthTime:(NSTimeInterval)birthTime;

/**
 *  @brief  根据时间返回相应的星座
 *
 *  @param time 要获取星座的时间
 *
 *  @return 星座名字
 */
+ (NSString *)nl_constellationWithTime:(NSTimeInterval)time;

+ (long long)nl_unixTimeInMillisecond;
+ (NSTimeInterval)nl_unixTimeInSecond;

@end
