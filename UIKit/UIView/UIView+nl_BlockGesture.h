//
//  UIView+nl_BlockGesture.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (nl_BlockGesture)

- (void)nl_addTapActionWithBlock:(GestureActionBlock)block;
- (void)nl_addLongPressActionWithBlock:(GestureActionBlock)block;

@end
