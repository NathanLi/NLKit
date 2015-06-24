//
//  UIView+Action.m
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-19.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIView+Action.h"

@implementation UIView (Action)
- (UITapGestureRecognizer *)addTarget:(id)object action:(SEL)action {
  self.userInteractionEnabled = YES;
  
  NSArray *gestures = [self gestureRecognizers];
  __block UITapGestureRecognizer *tapGesture = nil;
  [gestures indexOfObjectPassingTest:^BOOL(UITapGestureRecognizer *obj, NSUInteger idx, BOOL *stop) {
    if ([object isKindOfClass:[UITapGestureRecognizer class]]) {
      if (obj.numberOfTapsRequired == 1) {
        tapGesture = obj;
        *stop = YES;
        return YES;
      }
    }
    
    return NO;
  }];
  
  
  if (tapGesture == nil) {
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:object action:action];
  } else {
    [tapGesture addTarget:object action:action];
  }
  
  [self addGestureRecognizer:tapGesture];
  return tapGesture;
}

- (void)removeObject:(id)object action:(SEL)action {
  NSArray *gestures = [self gestureRecognizers];
  [gestures enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
    UITapGestureRecognizer *gesture = obj;
    if ([gesture isMemberOfClass:[UITapGestureRecognizer class]]) {
      [gesture removeTarget:object action:action];
    }
  }];
}

- (UILongPressGestureRecognizer *)addLongPressTarget:(id)object action:(SEL)action {
  self.userInteractionEnabled = YES;
  NSArray *gestures = [self gestureRecognizers];
  __block UILongPressGestureRecognizer *longPressGesture = nil;
  [gestures indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    if ([object isKindOfClass:[UILongPressGestureRecognizer class]]) {
      longPressGesture = obj;
      *stop = YES;
      return YES;
    }
    
    return NO;
  }];
  
  if (longPressGesture == nil) {
    longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:action];
    longPressGesture.minimumPressDuration = 1;
  } else {
    [longPressGesture addTarget:self action:action];
  }
  
  [self addGestureRecognizer:longPressGesture];
  return longPressGesture;
}

- (void)removeLongPressTarget:(id)object ation:(SEL)action {
  NSArray *gestures = [self gestureRecognizers];
  [gestures enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
    UILongPressGestureRecognizer *gesture = obj;
    if ([gesture isMemberOfClass:[UILongPressGestureRecognizer class]]) {
      [gesture removeTarget:object action:action];
    }
  }];
}
@end
