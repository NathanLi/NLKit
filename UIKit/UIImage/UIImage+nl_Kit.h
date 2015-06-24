//
//  UIImage+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-4-3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (nl_Kit)

- (UIImage *)nl_drawText:(NSString *)text inRect:(CGRect)rect;
- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font inRect:(CGRect)rect;

/**
 *  @brief  创建并返回一张新的图像对象，并且该图像可以中心点为复制点进行拉伸
 *
 *  @return 一张新的以中心点为复制点的可拉伸的图像
 */
- (UIImage *)nl_resizableImageCenter;

/**
 *  @brief  将本图像以一定压缩质量转换成data。  如果能转换成JPEG格式，则会转换成JPEG；否则会被转换成PNG格式的data
 *
 *  @param quality 压缩质量。详见UIImageJPEGRepresentation
 *
 *  @return 如果能转换成data，则返回data。否则返回nil。
 */
- (NSData *)nl_dataWithCompressionQuality:(CGFloat)quality;

/**
 *  @brief  将本图像以0.5的压缩质量转换成data。即[self nl_nl_dataWithCompressionQuality:0.5];
 *
 *  @return 如果能转换成data，则返回data。否则返回nil。
 */
- (NSData *)nl_data;

@end
