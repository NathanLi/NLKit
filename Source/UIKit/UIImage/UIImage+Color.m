//
//  UIImage+Color.m
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-19.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)nl_imageWithColor:(UIColor *)color
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

+ (UIImage *)nl_imageWithSize:(CGSize)size color:(UIColor *)color {
  CGRect rect = CGRectMake(0, 0, size.width, size.height);
  
  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  [color setFill];
  UIRectFill(rect);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

+ (UIImage *)nl_imageCenterClearWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)tintColor {
  return [self nl_imageCenterClearWithSize:size corner:corner tintColor:tintColor borderWidth:.0 borderColor:nil];
}

+ (UIImage *)nl_imageCenterClearWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)tintColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
  NSCParameterAssert((borderWidth < .3) || ((borderWidth > .3) && (borderColor != nil)));
  
  UIGraphicsBeginImageContextWithOptions(size, NO, .0);
  
  CGRect frame = CGRectMake(0, 0, size.width, size.height);
  CGContextRef context = UIGraphicsGetCurrentContext();
  if (tintColor) {
    CGContextSetFillColorWithColor(context, [tintColor CGColor]);
    CGContextFillRect(context, frame);
  }
  
  frame = CGRectMake(borderWidth, borderWidth, size.width - borderWidth * 2, size.height - borderWidth * 2);
  UIBezierPath *interior = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:corner];
  
  if (borderWidth > .3 && borderColor) {
    interior.lineWidth = borderWidth * 2;
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    [interior stroke];
  }
  
  CGContextSetBlendMode(context, kCGBlendModeClear);
  CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
  [interior addClip];
  CGContextFillRect(context, frame);
  CGContextSetBlendMode(context, kCGBlendModeNormal);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

+ (UIImage *)nl_imageWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)tintColor {
  UIGraphicsBeginImageContextWithOptions(size, NO, .0);
  
  CGRect frame = CGRectMake(0, 0, size.width, size.height);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [tintColor CGColor]);
  
  UIBezierPath *interior = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:corner];
  [interior addClip];
  
  CGContextFillRect(context, frame);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
