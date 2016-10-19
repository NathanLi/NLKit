//
//  UILabel+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/21.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+nl_Copy.h"
#import "NSString+nl_Kit.h"

#pragma mark - category(nl_Kit)
@interface UILabel (nl_Kit)


@end

#pragma mark - category(nl_Size)
@interface UILabel (nl_Size)

/**
 *  @brief  获取文本在本label中显示所需size
 *
 *  @param text 文本
 *
 *  @return 文本显示所需size
 */
- (CGSize)nl_sizeWithText:(NSString * _Nonnull )text;

/**
 *  @brief  获取本label中的文本显示所需size
 *
 *  @return 本label中的文本显示所需size
 */
- (CGSize)nl_sizeForOwnerText;

/**
 *  @brief 获取text在本label中显示时，在最大宽度为maxWidth时，所需高度
 *
 *  @param maxWidth 最大宽度
 *  @param text     文本
 *
 *  @return 文本显示所需高度
 */
- (CGFloat)nl_heightWithMaxWidth:(CGFloat)maxWidth text:(NSString * _Nonnull)text;

/**
 *  @brief 获取在最大宽度为maxWidth时，本label中的文本显示所需高度
 *
 *  @param maxWidth 最大宽度
 *
 *  @return 本label中文本显示所需高度
 */
- (CGFloat)nl_heightWithMaxWidth:(CGFloat)maxWidth;

+ (_Nonnull instancetype)nl_labelWithTextColor:(UIColor *_Nullable)textColor fontSize:(CGFloat)fontSize builder:(void (^_Nullable)(UILabel * _Nonnull label))builder;
+ (_Nonnull instancetype)nl_labelWithText:(NSString  * _Nullable )text textColor:(UIColor * _Nullable)textColor fontSize:(CGFloat)fontSize builder:(void (^ _Nullable)( UILabel * _Nonnull label))builder;
+ (_Nonnull instancetype)nl_labelWithText:(NSString * _Nullable)text textColor:(UIColor * _Nullable)textColor fontSize:(CGFloat)fontSize backgroundColor:(UIColor * _Nullable)backgroundColor builder:(void (^_Nullable )(UILabel *_Nonnull label))builder;

+ (_Nonnull instancetype)nl_labelWithTextColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize builder:(void (^_Nullable)(UILabel *_Nonnull label))builder;
+ (_Nonnull instancetype)nl_labelWithText:(NSString *_Nullable)text textColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize builder:(void (^ _Nullable )(UILabel *_Nonnull label))builder;
+ (_Nonnull instancetype)nl_labelWithText:(NSString *_Nullable )text textColorHex:(UInt32)colorHex fontSize:(CGFloat)fontSize backgroundColorHex:(UInt32)backgroundColorHex builder:(void (^_Nullable)(UILabel *_Nonnull label))builder;

@end
