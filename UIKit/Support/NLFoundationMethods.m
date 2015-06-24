//
//  NLFoundationMethods.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/6/17.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NLFoundationMethods.h"




@implementation NLFoundationMethods

+ (CGFloat)fixResolutionValue:(CGFloat)value {
  CGFloat scale = [[UIScreen mainScreen] scale];
  if (scale < 2.0) return value;
  
  CGFloat remain = value - (int)value;
  if (remain <= .0001) return value;
  
  CGFloat minSepator = 1.0 / scale;
  for (NSUInteger index = 0; index < scale; ++index) {
    CGFloat min = index * minSepator;
    CGFloat max = (index + 1) * minSepator;
    if (index == scale - 1) {
      max = 1.0;
    }
    
    if (NLInBound(remain, min, max)) {
      CGFloat fixRemain = MAX(remain, max);
      return (CGFloat)((int)value) + fixRemain;
    }
  }
  
  return value;
}

@end
