//
//  UILabel+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/21.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UILabel+nl_Kit.h"
#import "NSString+nl_Kit.h"
#import "UIColor+nl_Kit.h"

@implementation UILabel (nl_Kit)

@end

@implementation UILabel (nl_Size)

/**
 *  @brief  获取文本在本label中显示所需size
 *
 *  @param text 文本
 *
 *  @return 文本显示所需size
 */
- (CGSize)nl_sizeWithText:(NSString *)text {
  return [text nl_sizeWithFont:self.font];
}

/**
 *  @brief  获取本label中的文本显示所需size
 *
 *  @return 本label中的文本显示所需size
 */
- (CGSize)nl_sizeForOwnerText {
  return [self.text nl_sizeWithFont:self.font];
}

/**
 *  @brief 获取text在本label中显示时，在最大宽度为maxWidth时，所需高度
 *
 *  @param maxWidth 最大宽度
 *  @param text     文本
 *
 *  @return 文本显示所需高度
 */
- (CGFloat)nl_heightWithMaxWidth:(CGFloat)maxWidth text:(NSString *)text {
  return [text nl_heightWithWidth:maxWidth font:self.font];
}

/**
 *  @brief 获取在最大宽度为maxWidth时，本label中的文本显示所需高度
 *
 *  @param maxWidth 最大宽度
 *
 *  @return 本label中文本显示所需高度
 */
- (CGFloat)nl_heightWithMaxWidth:(CGFloat)maxWidth {
  return [self.text nl_heightWithWidth:maxWidth font:self.font];
}

+ (instancetype)nl_labelWithTextColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize builder:(void (^)(UILabel *label))builder {
  return [self nl_labelWithText:nil textColorHex:colorHex fontSize:fontSize builder:builder];
}

+ (instancetype)nl_labelWithText:(NSString *)text textColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize builder:(void (^)(UILabel *label))builder {
  return [self nl_labelWithText:text textColorHex:colorHex fontSize:fontSize backgroundColorHex:0 builder:builder];
}

+ (instancetype)nl_labelWithText:(NSString *)text textColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize backgroundColorHex:(UInt32)backgroundColorHex builder:(void (^)(UILabel *))builder {
  UIColor *textColor = colorHex > 0 ? [UIColor nl_colorWithHex:colorHex] : nil;
  UIColor *backgroundColor = backgroundColorHex > 0 ? [UIColor nl_colorWithHex:backgroundColorHex] : nil;
  return [self nl_labelWithText:text textColor:textColor fontSize:fontSize backgroundColor:backgroundColor builder:builder];
}

+ (instancetype)nl_labelWithTextColor:(UIColor *)textColor fontSize:(CGFloat)fontSize builder:(void (^)(UILabel *label))builder {
  return [self nl_labelWithText:nil textColor:textColor fontSize:fontSize builder:builder];
}

+ (instancetype)nl_labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize builder:(void (^)(UILabel *label))builder {
  return [self nl_labelWithText:text textColor:textColor fontSize:fontSize backgroundColor:nil builder:builder];
}

+ (instancetype)nl_labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor builder:(void (^)(UILabel *label))builder {
  UILabel *label = [self new];
  [label setText:text];
  [label setTextColor:textColor];
  if (fontSize > 1.0) {
    [label setFont:[UIFont systemFontOfSize:fontSize]];
  }
  
  if (backgroundColor) {
    [label setBackgroundColor:backgroundColor];
  }
  
  if (builder) {
    builder(label);
  }
  
  return label;
}

@end
