//
//  UIView+Action.h
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-19.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Action)
- (UITapGestureRecognizer *)addTarget:(id)object action:(SEL)action;
- (void)removeObject:(id)object action:(SEL)action;
- (UILongPressGestureRecognizer *)addLongPressTarget:(id)object action:(SEL)action;
- (void)removeLongPressTarget:(id)object ation:(SEL)action;
@end
