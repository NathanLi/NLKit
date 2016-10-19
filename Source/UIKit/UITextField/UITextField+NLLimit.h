//
//  UITextField+NLLimit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-25.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (NLLimit)

/// 用户输入的最大长度  中文字和英文字母都每一个长度
@property (assign, nonatomic) NSUInteger nl_maxLength;

/// 用户输入的最大长度  中文字算两个长度、英文字母算一个长度
@property (nonatomic, assign) NSUInteger nl_maxBytes;

@end
