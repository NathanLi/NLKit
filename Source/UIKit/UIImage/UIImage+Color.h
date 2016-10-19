//
//  UIImage+Color.h
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-19.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

//programmatically create an UIImage with 1 pixel of a given color
+ (UIImage *)nl_imageWithColor:(UIColor *)color;
+ (UIImage *)nl_imageWithSize:(CGSize)size color:(UIColor *)color;

/**
 *  @brief Create a UIImage with given color and center is clear color
 *
 *  @param size  New image size
 *  @param corner corner round
 *  @param color image color
 *
 *  @return new image
 */
+ (UIImage *)nl_imageCenterClearWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)color;

/**
 *  @brief Create a UIImage with given color and center clear color with border width and border color
 *
 *  @param size        new image size
 *  @param corner      new image corner
 *  @param color       tint color
 *  @param borderWidth border width
 *  @param borderColor border color
 *
 *  @return new image
 */
+ (UIImage *)nl_imageCenterClearWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  @brief Create a UIImage with given color and corner
 *
 *  @param size   New image size
 *  @param corner image corner
 *  @param color  image color
 *
 *  @return new image
 */
+ (UIImage *)nl_imageWithSize:(CGSize)size corner:(CGFloat)corner tintColor:(UIColor *)color;

@end
