//
//  NSDate+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/7/28.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSDate+nl_Kit.h"

@implementation NSDate (nl_Kit)

+ (int)nl_ageWithDateOfBirthTime:(NSTimeInterval)birthTime {
  return [self nl_ageWithDateOfBirth:[NSDate dateWithTimeIntervalSince1970:birthTime]];
}

+ (int)nl_ageWithDateOfBirth:(NSDate *)date {
  // 出生日期转换 年月日
  NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
  NSInteger brithDateYear  = [components1 year];
  NSInteger brithDateDay   = [components1 day];
  NSInteger brithDateMonth = [components1 month];
  
  // 获取系统当前 年月日
  NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
  NSInteger currentDateYear  = [components2 year];
  NSInteger currentDateDay   = [components2 day];
  NSInteger currentDateMonth = [components2 month];
  
  // 计算年龄
  NSInteger iAge = currentDateYear - brithDateYear - 1;
  if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
    iAge++;
  }
  
  return (int)iAge;
}

+ (NSString *)nl_constellationWithTime:(NSTimeInterval)time {
  NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
  NSInteger day   = [components day];
  NSInteger month = [components month];
  
  NSString *constellation = [self nl_getAstroWithMonth:month day:day];
  return constellation;
}

+ (NSString *)nl_getAstroWithMonth:(NSInteger)m day:(NSInteger)d {
  NSParameterAssert((m >= 1 && m <= 12));
  NSParameterAssert((d >= 1 && d <= 31));
  
  NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
  NSString *astroFormat = @"102123444543";
  NSString *result;
  
  if(m == 2 && d > 29) {
    return nil;
  } else if(m==4 || m==6 || m==9 || m==11) {
    if (d > 30) {
      return nil;
    }
  }
  
  result = [NSString stringWithFormat:@"%@座",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
  
  return result;
}

+ (long long)nl_unixTimeInMillisecond {
  return [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (NSTimeInterval)nl_unixTimeInSecond {
  return [[NSDate date] timeIntervalSince1970];
}

@end
