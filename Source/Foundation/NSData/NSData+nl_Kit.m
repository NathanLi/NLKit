//
//  NSData+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/7/3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSData+nl_Kit.h"

@implementation NSData (nl_Kit)

- (BOOL)nl_isGifData {
  if (self.length > 4) {
    const unsigned char *bytes = [self bytes];
    return bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46;
  }
  
  return NO;
}

- (NSString *)nl_base64ToString {
  const uint8_t* input = (const uint8_t*)[self bytes];
  NSInteger length = [self length];
  static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
  uint8_t* output = (uint8_t*)data.mutableBytes;
  NSInteger i;
  for (i=0; i < length; i += 3) {
    NSInteger value = 0;
    NSInteger j;
    for (j = i; j < (i + 3); j++) {
      value <<= 8;
      
      if (j < length) {
        value |= (0xFF & input[j]);
      }
    }
    NSInteger theIndex = (i / 3) * 4;
    output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
    output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
    output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
    output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
  }
  return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end
