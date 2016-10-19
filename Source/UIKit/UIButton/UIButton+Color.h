//
//  UIButton+Color.h
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-22.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  使用颜色为Button生成背景图
 */
@interface UIButton (Color)


/**
 *  将按钮的背景颜色值改为背景图
 */
- (void)convertBackgroundColorToBackgroundImage;
- (void)convertBackgroundColorToBackgroundImageForState:(UIControlState)state;

/**
 *  将按钮的背景颜色改为按钮图
 */
- (void)convertBackgroundColorToImage;
- (void)convertBackgroundColorToImageForState:(UIControlState)state;

/**
 * 用颜色为button生成背景图
 */
- (UIImage *)setBackgroundImageWithColor:(UIColor *)color forState:(UIControlState)state;

/**
 *  用颜色为button生成图
 */
- (UIImage *)setImageWithColor:(UIColor *)color forState:(UIControlState)state;

@end
