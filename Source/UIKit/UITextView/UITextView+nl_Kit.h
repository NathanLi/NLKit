//
//  UITextView+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/29.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+NLLimit.h"
#import "UITextView+nl_Placeholder.h"

@interface UITextView (nl_Kit)

@end

@interface UITextView (nl_inputAccessoryView)

@property (weak, nonatomic) UIResponder *nl_lastFirstResponder;
@property (weak, nonatomic) UIResponder *nl_nextFirstResponder;
@property (assign, nonatomic) BOOL nl_showInputAccessoryView; // 自动展示NLInputAccessoryView工具条

@end


@interface UITextView (nl_range)

/**
 *  @brief 当前所选择 range （可以用来定位渔村）
 *
 *  @return range
 */
- (NSRange)nl_selectedRange;

/**
 *  @brief 设置文本选择 range   
 *         self 必须为第一响应者才有效
 */
- (void)setNl_selectedRange:(NSRange)range;

@end