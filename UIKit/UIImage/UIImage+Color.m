//
//  UIImage+Color.m
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-19.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
  CGRect rect = CGRectMake(0, 0, 1, 1);
  
  // create a 1 by 1 pixel context
  UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
  [color setFill];
  UIRectFill(rect);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
