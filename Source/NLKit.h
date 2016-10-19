//
//  NLKit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/5.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+nl_Kit.h"
#import "NLFoundationMethods.h"
#import "CGRect+Additions.h"
#import "UILabel+nl_Kit.h"
#import "UIView+Action.h"
#import "UIView+nl_Kit.h"
#import "UITableView+HoomicTool.h"
#import "NSMutableAttributedString+nl_Image.h"
#import "UIImage+Color.h"
#import "UIImage+nl_Kit.h"
#import "UIButton+nl_kit.h"
#import "CLLocation+NL_String.h"
#import "NSArray+nl_Kit.h"
#import "UITextField+nl_Kit.h"
#import "UITextView+nl_Kit.h"
#import "NSString+nl_Kit.h"
#import "UIView+nl_BlockGesture.h"
#import "NSDictionary+nl_Kit.h"
#import "NSURLRequest+nl_Kit.h"
#import "UIColor+nl_Kit.h"
#import "NSData+nl_Kit.h"
#import "NSDate+nl_Kit.h"
#import "UINavigationBar+nl_Kit.h"
#import "UIPickerView+nl_Kit.h"
#import "UITableView+nl_Kit.h"
#import "UICollectionView+nl_Kit.h"
#import "UIAlertController+nl_Kit.h"
#import "NLNetworkStatus.h"

@interface NLKit : NSObject

/**
 *  @brief cpu 使用率
 *
 *  @return 浮点数 cpu 的使用率
 */
+ (float)cpu_usage;

@end
