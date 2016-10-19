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