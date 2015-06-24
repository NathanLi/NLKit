//
//  UIColor+nl_Hex.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/6/3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (nl_Hex)

+ (UIColor *)nl_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

+ (UIColor *)nl_colorWithHex:(UInt32)hex;
+ (UIColor *)nl_colorWithHexString:(id)input;

- (UInt32)nl_hexValue;

@end
