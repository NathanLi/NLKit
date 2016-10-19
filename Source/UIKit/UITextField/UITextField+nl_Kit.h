//
//  UITextField+nl_Kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/4/29.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+NLLimit.h"
#import "NLInputAccessoryView.h"

@interface UITextField (nl_Kit)

@end

/**
 *  @brief  UITextFieldDelegate的快捷方法  注意：当你自己设置了UITextField的delegate时，这里面的内容都将失效
 */
@interface UITextField (nl_textFieldDelegate)

/**
 *  @brief  当点击return key后的下一个获取键盘焦点的对象
 */
@property (weak, nonatomic) UIResponder *nl_nextFirstResponder;

/**
 *  @brief  当点击return key后调用的block
 *
 *  @param returnKeyBlock 点击return key后调用的block
 */
- (void)nl_returnKeyBlock:(void(^)(void))returnKeyBlock;

@end

@interface UITextField (nl_inputAccessoryView)

@property (weak, nonatomic) UIResponder *nl_lastFirstResponder;
@property (assign, nonatomic) BOOL nl_showInputAccessoryView; // 自动展示NLInputAccessoryView工具条

@end