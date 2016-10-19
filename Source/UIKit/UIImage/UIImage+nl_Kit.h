//
//  UIImage+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-4-3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Color.h"

@interface UIImage (nl_Kit)

/**
 *  @brief 可以用于关联 data 数据
 */
@property (nonatomic, strong) NSData *nl_imageData;

- (UIImage *)nl_drawText:(NSString *)text;
- (UIImage *)nl_drawText:(NSString *)text inRect:(CGRect)rect;
- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font inRect:(CGRect)rect;
- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font;

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


/**
 *  @brief  判断本图片是不是gif图
 *
 *  @return 如果是gif图，返回YES；否则返回NO
 */
- (BOOL)nl_isGifImage;

/**
 *  @brief  给图片加个透明度
 *
 *  @param alpha 透明度
 *
 *  @return 带有透明度的图片
 */
- (UIImage *)nl_translucentImageWithAlpha:(CGFloat)alpha;

/**
 *  @brief  根据本图片生成UIButton的类似的高色阴影（即变暗）
 *
 *  @return 图片
 */
- (UIImage *)nl_buttonStyleHighlightImage;

/**
 *  @brief  根据本图生成一张新的图片
 *
 *  @param size 要生成的新的图片的大小
 *
 *  @return 新图片
 */
- (UIImage *)nl_resizeWithSize:(CGSize)size;
- (UIImage *)nl_resizeWithScale:(CGFloat)scale;

/**
 *  @brief  根据本图生成一张新的图片
 *
 *  @param color 新图的背景色
 *  @param size  新图的大小
 *
 *  @return 新图
 */
- (UIImage *)nl_drawWithBackgroundColor:(UIColor *)color size:(CGSize)size;

/**
 *  @brief  根据本图生成一张带有圆角新的图片
 *
 *  @param cornerRadius 要生成的新和图片的圆角
 *
 *  @return 新图
 */
- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius;
- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)size;
- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  @brief 计算图片所占内存大小
 *
 *  @return 图片大小
 */
- (NSUInteger)nl_calculatedSize;

/**
 *  @brief 获取类似于UITableViewCell 中的 disclosure indicator 图
 *
 *  @return 图片
 */
+ (UIImage *)nl_cellAccessoryDisclosureIndicatorImage;

@end
