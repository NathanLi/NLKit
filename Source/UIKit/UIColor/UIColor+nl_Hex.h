//
//  UIColor+nl_Hex.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/6/3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (nl_Hex)

/**
 * Creates a new UIColor instance using a hex input and alpha value.
 *
 * @param hex     The Color hex.
 * @param alpha   The Color alpha.
 *
 * @return UIColor
 */
+ (UIColor *)nl_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;


/**
 * Creates a new UIColor instance using a hex input.
 *
 * @param hex The color hex.
 *
 * @return UIColor
 */
+ (UIColor *)nl_colorWithHex:(UInt32)hex;

/**
 * Creates a new UIColor instance using a hex string input.
 *
 * @param hexString (ie: @"ff", @"#fff", @"ff0000", or @"ff00ffcc")
 *
 * @return UIColor
 */
+ (UIColor *)nl_colorWithHexString:(id)hexString;

/**
 * Returns the hex value of the receiver. Alpha value is not included.
 *
 * @return {UInt32}
 */
- (UInt32)nl_hexValue;

@end
