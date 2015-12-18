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

@end
