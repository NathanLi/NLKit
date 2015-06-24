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
static char kActionHandlerLongPressBlockKey;

@implementation UIView (nl_BlockGesture)

- (void)nl_addTapActionWithBlock:(GestureActionBlock)block
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
}

- (void)nl_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateRecognized)
  {
    GestureActionBlock block = [self nl_associatedValueForKey:&kActionHandlerTapBlockKey];
    if (block)
    {
      block(gesture);
    }
  }
}

- (void)nl_addLongPressActionWithBlock:(GestureActionBlock)block
{
  UILongPressGestureRecognizer *gesture = [self nl_associatedValueForKey:_cmd];
  if (!gesture)
  {
    gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(nl_handleActionForLongPressGesture:)];
    [self addGestureRecognizer:gesture];
    [self nl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self nl_setAssociateCopyValue:block withKey:&kActionHandlerLongPressBlockKey];
  self.userInteractionEnabled = YES;
}

- (void)nl_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateRecognized)
  {
    GestureActionBlock block = [self nl_associatedValueForKey:&kActionHandlerLongPressBlockKey];
    if (block)
    {
      block(gesture);
    }
  }
}

@end
