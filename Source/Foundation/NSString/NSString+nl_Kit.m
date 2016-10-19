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

- (BOOL)nl_isEmpty {
  return self.length == 0;
}

+ (NSString *)nl_formatWithFileSize:(long long)fileSize {
  return [NSByteCountFormatter stringFromByteCount:fileSize countStyle:NSByteCountFormatterCountStyleBinary];
}

- (NSDictionary<NSString *,id> *)nl_URLParameterDictionary {
  NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
  
  if (self.length && [self rangeOfString:@"="].location != NSNotFound) {
    NSArray *keyValuePairs = [self componentsSeparatedByString:@"&"];
    for (NSString *keyValuePair in keyValuePairs) {
      NSArray *pair = [keyValuePair componentsSeparatedByString:@"="];
      // don't assume we actually got a real key=value pair. start by assuming we only got @[key] before checking count
      NSString *paramValue = pair.count == 2 ? pair[1] : @"";
      // CFURLCreateStringByReplacingPercentEscapesUsingEncoding may return NULL
      parameters[pair[0]] = [paramValue nl_URLDecodedString] ?: @"";
    }
  }
  
  return parameters;
}

- (NSString *)nl_addParameters:(NSDictionary<NSString *,id> *)parameters {
  NSString *originString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  NSMutableString *result = [NSMutableString stringWithString:originString];
  [parameters enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    key = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([obj isKindOfClass:[NSString class]]) {
      obj = [obj stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    if ([result nl_isContainString:@"?"]) {
      [result appendFormat:@"&%@=%@", key, obj];
    } else {
      [result appendFormat:@"?%@=%@", key, obj];
    }
  }];
  
  return result;
}

- (NSString *)nl_URLDecodedString {
  NSString *input = [self stringByReplacingOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, self.length)];
  return [input stringByRemovingPercentEncoding];
}

- (long)longValue {
  return [self integerValue];
}

@end

@implementation NSString (nl_Size)

- (CGSize)nl_sizeWithFont:(UIFont *)font {
  if ([self length] == 0) return CGSizeZero;
  
  return [self sizeWithAttributes:@{NSFontAttributeName: font}];
}

- (CGSize)nl_sizeWithLimitSize:(CGSize)size font:(UIFont *)font {
  return [self nl_sizeWithLimitSize:size attributes:@{NSFontAttributeName: font}];
}

- (CGFloat)nl_heightWithWidth:(CGFloat)width font:(UIFont *)font {
  return ceilf([self nl_sizeWithLimitSize:CGSizeMake(width, MAXFLOAT) font:font].height);
}

- (CGSize)nl_sizeWithLimitSize:(CGSize)size attributes:(NSDictionary *)attributes {
  if ([self length] == 0) return CGSizeZero;
  
  CGSize stringSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
  stringSize.width = ceilf(stringSize.width);
  stringSize.height = ceilf(stringSize.height);
  return stringSize;
}

@end

@implementation NSString (nl_extension)

- (BOOL)nl_isGifExtension {
  NSString *extension = [self pathExtension];
  BOOL isPicGif = [extension caseInsensitiveCompare:@"gif"] == NSOrderedSame;
  
  return isPicGif;
}
- (BOOL)nl_isMP4Extension {
  NSString *extension = [self pathExtension];
  BOOL isMP4 = [extension caseInsensitiveCompare:@"mp4"] == NSOrderedSame;
  
  return isMP4;
}

- (BOOL)nl_isMovExtension {
  NSString *extension = [self pathExtension];
  BOOL isMov = [extension caseInsensitiveCompare:@"mov"] == NSOrderedSame;
  
  return isMov;
}

@end
