//
//  UIView+nl_BlockGesture.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIView+nl_BlockGesture.h"
#import "NSObject+nl_associatedObject.h"

static char kActionHandlerTapBlockKey;
static char kActionHandlerDoubleTagBlockKey;
static char kActionHandlerLongPressBlockKey;

@implementation UIView (nl_BlockGesture)

- (UITapGestureRecognizer *)nl_addTapActionWithBlock:(GestureActionBlock)block
{
  UITapGestureRecognizer *gesture = [self nl_associatedValueForKey:_cmd];
  if (!gesture)
  {
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nl_handleActionForTapGesture:)];
    [self addGestureRecognizer:gesture];
    [self nl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self nl_setAssociateCopyValue:block withKey:&kActionHandlerTapBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)nl_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateEnded)
  {
    GestureActionBlock block = [self nl_associatedValueForKey:&kActionHandlerTapBlockKey];
    if (block)
    {
      block(gesture);
    }
  }
}

- (UITapGestureRecognizer *)nl_addDoubleTapActionWithBlock:(GestureActionBlock)block {
  UITapGestureRecognizer *gesture = [self nl_associatedValueForKey:_cmd];
  if (!gesture) {
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nl_handleActionForDoubleTapGesture:)];
    [gesture setNumberOfTapsRequired:2];
    [self addGestureRecognizer:gesture];
    [self nl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self nl_setAssociateCopyValue:block withKey:&kActionHandlerDoubleTagBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)nl_handleActionForDoubleTapGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateRecognized) {
    GestureActionBlock block = [self nl_associatedValueForKey:&kActionHandlerDoubleTagBlockKey];
    if (block) {
      block(gesture);
    }
  }
}

- (UILongPressGestureRecognizer *)nl_addLongPressActionWithBlock:(GestureActionBlock)block {
  UILongPressGestureRecognizer *gesture = [self nl_associatedValueForKey:_cmd];
  if (!gesture) {
    gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(nl_handleActionForLongPressGesture:)];
    [self addGestureRecognizer:gesture];
    [self nl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self nl_setAssociateCopyValue:block withKey:&kActionHandlerLongPressBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)nl_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateBegan)
  {
    GestureActionBlock block = [self nl_associatedValueForKey:&kActionHandlerLongPressBlockKey];
    if (block) {
      block(gesture);
    }
  }
}

@end
