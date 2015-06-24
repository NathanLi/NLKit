//
//  UIButton+nl_Block.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NLButtonActionBlock)();

@interface UIButton (nl_Block)

/**
 *  @brief  给按钮加上click事件
 *
 *  @param action 当按钮click时要执行的block。
 */
- (void)nl_handleClickBlock:(NLButtonActionBlock)action;

/**
 *  @brief 给按钮加上block事件
 *
 *  @param events 要响应的事件
 *  @param action 当events触发时，要执行的block
 */
- (void)nl_handleControlEvents:(UIControlEvents)events withBlock:(NLButtonActionBlock)action;

@end
