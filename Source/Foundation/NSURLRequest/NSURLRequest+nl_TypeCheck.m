//
//  NSURLRequest+nl_TypeCheck.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSURLRequest+nl_TypeCheck.h"

@implementation NSURLRequest (nl_TypeCheck)

- (BOOL)nl_isTel {
  return [[[self URL] absoluteString] hasPrefix:@"tel:"];
}

- (BOOL)nl_isSms {
  return [[[self URL] absoluteString] hasPrefix:@"sms:"];
}

- (BOOL)nl_isMail {
  return [[[self URL] absoluteString] hasPrefix:@"mailto:"];
}

@end
