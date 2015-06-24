//
//  NSString+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/21.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSString+nl_Kit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (nl_Kit)

+ (BOOL)nl_isEqualString:(NSString *)string toOtherString:(NSString *)otherString {
  if (string == otherString) {
    return YES;
  }
  
  return [string isEqualToString:otherString];
}

- (NSString *)nl_MD5 {
  const char *cStr = [self UTF8String];
  unsigned char result[32];
  CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
  
  return [NSString stringWithFormat:
          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
          result[0],result[1],result[2],result[3],
          result[4],result[5],result[6],result[7],
          result[8],result[9],result[10],result[11],
          result[12],result[13],result[14],result[15]];
}

- (BOOL)nl_isVaildPhoneNumber {
  NSString *phoneRegex = @"^1\\d{10}$";
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
  return [predicate evaluateWithObject:self];
}

- (BOOL)nl_isVaildQQ {
  NSString *qqRegex = @"^[1-9]\\d{4,9}$";
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", qqRegex];
  return [predicate evaluateWithObject:self];
}

- (BOOL)nl_isContainString:(NSString *)subString {
  return [self rangeOfString:subString].location != NSNotFound;
}

- (BOOL)nl_lessThanVersion:(NSString *)newVersion {
  return [self compare:newVersion options:NSNumericSearch] == NSOrderedAscending;
}

@end

@implementation NSString (nl_Size)

- (CGSize)nl_sizeWithFont:(UIFont *)font {
  if ([self length] == 0) return CGSizeZero;
  
  return [self sizeWithAttributes:@{NSFontAttributeName: font}];
}

- (CGSize)nl_sizeWithLimitSize:(CGSize)size font:(UIFont *)font {
  if ([self length] == 0) return CGSizeZero;
  
  return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
}

- (CGFloat)nl_heightWithWidth:(CGFloat)width font:(UIFont *)font {
  return [self nl_sizeWithLimitSize:CGSizeMake(width, MAXFLOAT) font:font].height;
}

@end
