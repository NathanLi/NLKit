//
//  NSString+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/21.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - category(nl_Kit)
@interface NSString (nl_Kit)

/**
 *  @brief  判断两个字符串是否相等
 *          注意：如果两个字串都为nil，也返回YES
 */
+ (BOOL)nl_isEqualString:(NSString *)string toOtherString:(NSString *)otherString;

/**
 *  @brief  转换成MD5字符串
 *
 *  @return MD5字符串
 */
- (NSString *)nl_MD5;

/**
 *  @brief  是否是合法的手机号码
 *
 *  @return 如果是合法的手机号码则返回YES；否则返回NO
 */
- (BOOL)nl_isVaildPhoneNumber;

/**
 *  @brief  是否有子串
 *
 *  @param subString 要判断的字符串
 *
 *  @return 如果有包含子串，则返回YES   否则返回NO
 */
- (BOOL)nl_isContainString:(NSString *)subString;

/**
 *  @brief  判断是否是合法的QQ号码
 *
 *  @return 如果是合法的QQ号码，则返回YES；否则返回NO
 */
- (BOOL)nl_isVaildQQ;

/**
 *  @brief  当前字符串（应该是版本号）是否小于newVersion。
 *          如“1.1.0211” 则小于 "1.2.0210"
 *  @param newVersion 新的版本号  如“1.2.0210”
 *
 *  @return 如果小于newVersion，返回YES；否则返回NO
 */
- (BOOL)nl_lessThanVersion:(NSString *)newVersion;

- (BOOL)nl_isEmpty;

/**
 *  @brief 格式化文件大小字符串
 *
 *  @param fileSize 文件大小
 *
 *  @return 格式化后的字符串对象。形如：1.12MB ...
 */
+ (NSString *)nl_formatWithFileSize:(long long)fileSize;

/**
 *  @brief 将字符串当作URL的参数进行解析
 *
 *  @return 解析后的字典
 */
- (NSDictionary<NSString *, id> *)nl_URLParameterDictionary;

/**
 *  @brief 将字符串当作URL，并在其后面加上参数
 *
 *  @param parameters 要加上的参数
 *
 *  @return 新生成的字符串
 */
- (NSString *)nl_addParameters:(NSDictionary<NSString *, id> *)parameters;

- (long)longValue;

@end


#pragma mark - category(nl_Size)
/**
 *  @brief  主要用于计算字符串在屏幕上的大小
 */
@interface NSString (nl_Size)

/**
 *  @brief  获取要显示该文本的所需要的size
 *
 *  @param font 字体
 *
 *  @return 要显示文本所需size
 */
- (CGSize)nl_sizeWithFont:(UIFont *)font;

/**
 *  @brief 获取要显示该文本的所需要的size
 *
 *  @param size 限定大小，即返回的size不会超过这个所限定的大小
 *  @param font 字体
 *
 *  @return 要显示文本所需size
 */
- (CGSize)nl_sizeWithLimitSize:(CGSize)size font:(UIFont *)font;

/**
 *  @brief  获取要显示文本的所需的高度
 *
 *  @param width 限定的宽度
 *  @param font  字体
 *
 *  @return 文本所需高度
 */
- (CGFloat)nl_heightWithWidth:(CGFloat)width font:(UIFont *)font;

- (CGSize)nl_sizeWithLimitSize:(CGSize)size attributes:(NSDictionary *)attributes;

@end

@interface NSString (nl_extension)

- (BOOL)nl_isGifExtension;
- (BOOL)nl_isMP4Extension;
- (BOOL)nl_isMovExtension;

@end
