//
//  UIView+NLLayer.h
//  jobsradar
//
//  Created by Nathan Li on 14-8-18.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+nl_BlockGesture.h"

@interface UIView (NLLayer)

@property (nonatomic, assign) CGFloat round;   // view round
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

@property (nonatomic, assign) UIColor *nl_shadowColor;
@property (nonatomic, assign) CGFloat nl_shadowRadius;
@property (assign, nonatomic) CGSize nl_shadowOffset;
@property (assign, nonatomic) CGFloat nl_shadowOpacity;

- (void)setBorderWith:(CGFloat)width color:(UIColor *)color;

- (void)nl_setBorderWith:(CGFloat)width color:(UIColor *)color top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right;
- (void)nl_setTopBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)nl_setLeftBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)nl_setBottomBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)nl_setRightBorderWith:(CGFloat)width color:(UIColor *)color;
@end

@interface UIView (NL_Frame)

@property (nonatomic, assign) CGPoint nl_origin;
@property (nonatomic, assign) CGSize  nl_size;
@property (nonatomic, assign) CGFloat nl_x, nl_y, nl_width, nl_height;
@property (nonatomic, assign) CGFloat nl_left, nl_right, nl_top, nl_bottom;
@property (nonatomic, assign) CGFloat nl_centerX;
@property (nonatomic, assign) CGFloat nl_centerY;
@property (nonatomic, readonly) CGPoint nl_boundsCenter;

@end

@interface UIView (nl_Kit)

@property (copy, nonatomic) BOOL (^nl_pointInsideBlock)(CGPoint point, UIEvent *event);

/**
 *  @brief  block for - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
 *      Note: write
 *          return [self nl_hitTest:point withEvent:(UIEvent *)event];
 *        at the end of block.
 */
@property (copy, nonatomic) UIView *(^nl_hitTestBlock)(CGPoint point, UIEvent *event);
- (UIView *)nl_hitTest:(CGPoint)point withEvent:(UIEvent *)event;


/**
 *  @brief  当前本view下的获取了键盘焦点的view
 *
 *  @return 如果有subView获取了焦点，返回该view  否则返回YES
 */
- (UIView *)nl_firstResponder;

/**
 *  @brief  在 `- despction` 里会用到的额外信息
 */
@property (nonatomic, strong) id nl_key;

@end


@interface UIView (nl_Image)

/**
 *  @brief  对本view截图
 *
 *  @return 截图后的UIImage
 */
- (UIImage *)nl_screenshot;

@end