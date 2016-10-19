//
//  UIImage+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-4-3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIImage+nl_Kit.h"
#import "UIColor+nl_Hex.h"
#import "CGRect+Additions.h"
#import "NSObject+nl_Kit.h"

@implementation UIImage (nl_Kit)

- (NSData *)nl_imageData {
  return [self nl_associatedValueForKey:_cmd];
}

- (void)setNl_imageData:(NSData *)nl_imageData {
  [self nl_setAssociateValue:nl_imageData withKey:@selector(nl_imageData)];
}

- (UIImage *)nl_resizeWithSize:(CGSize)size {
  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  [self drawInRect:CGRectMakeWithOriginAndSize(CGPointZero, size)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
   return newImage;
}

- (UIImage *)nl_resizeWithScale:(CGFloat)scale {
  CGFloat width = self.size.width * scale;
  CGFloat height = self.size.height * scale;
  return [self nl_resizeWithSize:CGSizeMake(width, height)];
}

- (UIImage *)nl_drawText:(NSString *)text {
  return [self nl_drawText:text inRect:CGRectMake(0, 0, self.size.width, self.size.height)];
}

- (UIImage *)nl_drawText:(NSString *)text inRect:(CGRect)rect {
  return [self nl_drawText:text font:[UIFont systemFontOfSize:[UIFont labelFontSize]] inRect:rect];
}

- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font {
  return [self nl_drawText:text font:font inRect:CGRectMake(0, 0, self.size.width, self.size.height)];
}

- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font inRect:(CGRect)rect {
  UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
  [self drawInRect:CGRectMake(0,0, self.size.width,self.size.height)];
  [[UIColor whiteColor] set];
  
  NSDictionary *att = @{NSFontAttributeName:font,
                        NSForegroundColorAttributeName: [UIColor whiteColor]};
  CGSize size = [text sizeWithAttributes:att];
  rect = CGRectMakeWithCenterAndSize(CGRectCenter(rect), size);
  [text drawInRect:rect withAttributes:att];
  
  
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

- (UIImage *)nl_drawWithBackgroundColor:(UIColor *)color size:(CGSize)size {
  CGPoint centerPoint = CGPointZero;
  if (size.height >= self.size.height && size.width >= self.size.width) {
    CGFloat x = (size.width - self.size.width) / 2.0;
    CGFloat y = (size.height - self.size.height) / 2.0;
    centerPoint = CGPointMake(x, y);
  }
  
  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  [color setFill];
  UIRectFill(CGRectMakeWithOriginAndSize(CGPointZero, size));
  [self drawInRect:CGRectMakeWithOriginAndSize(centerPoint, self.size)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

- (UIImage *)nl_resizableImageCenter {
  CGFloat top = self.size.height / 2;
  CGFloat left = self.size.width / 2;
  UIImage *newImage = [self resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top + 1, left + 1)];
  return newImage;
}

- (NSData *)nl_dataWithCompressionQuality:(CGFloat)quality {
  NSData *data = UIImageJPEGRepresentation(self, 0.5);
  if (data == nil) {
    data = UIImagePNGRepresentation(self);
  }
  return data;
}

- (NSData *)nl_data {
  return [self nl_dataWithCompressionQuality:.5];
}

- (BOOL)nl_isGifImage {
  return [self.images count] > 0 && self.duration > .0;
}

- (UIImage *)nl_translucentImageWithAlpha:(CGFloat)alpha {
  UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
  CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
  [self drawInRect:bounds blendMode:kCGBlendModeScreen alpha:alpha];
  
  UIImage * translucentImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return translucentImage;
}

- (UIImage *)nl_buttonStyleHighlightImage {
  return [self rt_tintedImageWithColor:[UIColor colorWithWhite:0.2 alpha:0.7]];
}

// Tint: Color
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color {
  return [self rt_tintedImageWithColor:color level:1.0f];
}

// Tint: Color + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color level:(CGFloat)level {
  CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
  return [self rt_tintedImageWithColor:color rect:rect level:level];
}

// Tint: Color + Rect
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect {
  return [self rt_tintedImageWithColor:color rect:rect level:1.0f];
}

// Tint: Color + Rect + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level {
  CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
  
  UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  [self drawInRect:imageRect];
  
  CGContextSetFillColorWithColor(ctx, [color CGColor]);
  CGContextSetAlpha(ctx, level);
  CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
  CGContextFillRect(ctx, rect);
  
  CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
  UIImage *darkImage = [UIImage imageWithCGImage:imageRef
                                           scale:self.scale
                                     orientation:self.imageOrientation];
  CGImageRelease(imageRef);
  
  UIGraphicsEndImageContext();
  
  return darkImage;
}

// Tint: Color + Insets
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets {
  return [self rt_tintedImageWithColor:color insets:insets level:1.0f];
}

// Tint: Color + Insets + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets level:(CGFloat)level {
  CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
  return [self rt_tintedImageWithColor:color rect:UIEdgeInsetsInsetRect(rect, insets) level:level];
}

// Light: Level
-(UIImage*)rt_lightenWithLevel:(CGFloat)level {
  return [self rt_tintedImageWithColor:[UIColor whiteColor] level:level];
}

// Light: Level + Insets
-(UIImage*)rt_lightenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets {
  return [self rt_tintedImageWithColor:[UIColor whiteColor] insets:insets level:level];
}

// Light: Level + Rect
-(UIImage*)rt_lightenRect:(CGRect)rect withLevel:(CGFloat)level {
  return [self rt_tintedImageWithColor:[UIColor whiteColor] rect:rect level:level];
}

// Dark: Level
-(UIImage*)rt_darkenWithLevel:(CGFloat)level {
  return [self rt_tintedImageWithColor:[UIColor blackColor] level:level];
}

// Dark: Level + Insets
-(UIImage*)rt_darkenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets {
  return [self rt_tintedImageWithColor:[UIColor blackColor] insets:insets level:level];
}

// Dark: Level + Rect
-(UIImage*)rt_darkenRect:(CGRect)rect withLevel:(CGFloat)level {
  return [self rt_tintedImageWithColor:[UIColor blackColor] rect:rect level:level];
}

- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius {
  /**
   *  @brief  对画布裁剪成圆形–》然后再将原始图像画出来–》
   */
  return [self nl_drawWithCornerRadius:cornerRadius size:self.size];
}

- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)size {
  return [self nl_drawWithCornerRadius:cornerRadius size:size borderWidth:.0 borderColor:nil];
}

- (UIImage *)nl_drawWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
  NSCParameterAssert(borderWidth < size.width);
  
  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGFloat lineWidth = MAX(borderWidth, .0);
  CGRect rect = CGRectMake(lineWidth / 2.0, lineWidth / 2.0, size.width - lineWidth, size.height - lineWidth);
  UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
  if (lineWidth > 0) {
    [borderColor setFill];
    [rectanglePath fill];
    [borderColor setStroke];
    rectanglePath.lineWidth = lineWidth;
    [rectanglePath stroke];
  }
  
  CGContextAddPath(context, rectanglePath.CGPath);
  CGContextClip(context);
  
  [self drawInRect:rect];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

- (NSUInteger)nl_calculatedSize {
  return CGImageGetHeight(self.CGImage) * CGImageGetBytesPerRow(self.CGImage);
}

+ (UIImage *)nl_cellAccessoryDisclosureIndicatorImage {
  static UIImage *image = nil;
  
  if (!image) {
    CGSize sizeImage = CGSizeMake(8, 13.0);
    UIGraphicsBeginImageContextWithOptions(sizeImage, NO, .0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    __nl_DrawDisclosureIndicator(context, sizeImage);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  
  return image;
}

// Draws a disclosure indicator such that the tip of the arrow is at (x,y)
void __nl_DrawDisclosureIndicator(CGContextRef ctxt, CGSize size) {
  static const CGFloat W = 1.5; // line width
  
  CGFloat x = size.width - W;
  CGFloat y = size.height / 2.0;
  
  CGContextSaveGState(ctxt);
  CGContextMoveToPoint(ctxt, .0, .0);
  CGContextAddLineToPoint(ctxt, x, y);
  CGContextAddLineToPoint(ctxt, .0, size.height);
  CGContextSetLineWidth(ctxt, W);
  [[UIColor nl_colorWithHex:0xCACACA] set];
  CGContextStrokePath(ctxt);
  CGContextRestoreGState(ctxt);
}

@end
