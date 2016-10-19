//
//  UILabel+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/21.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UILabel+nl_Kit.h"
#import "NSString+nl_Kit.h"

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

@end
