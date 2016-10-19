//
//  UIButton+nl_Block.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIButton+nl_Block.h"
#import "NSObject+nl_associatedObject.h"

@implementation UIButton (nl_Block)

- (void)nl_handleClickBlock:(NLButtonActionBlock)action {
  [self nl_handleControlEvents:UIControlEventTouchUpInside withBlock:action];
}

- (void)nl_handleControlEvents:(UIControlEvents)events withBlock:(NLButtonActionBlock)action {
  [self nl_setAssociateCopyValue:action withKey:@selector(nl_handleControlEvents:withBlock:)];
  [self addTarget:self action:@selector(nl_buttonAction:) forControlEvents:events];
}

- (void)nl_buttonAction:(id)sender {
  NLButtonActionBlock block = (NLButtonActionBlock)[self nl_associatedValueForKey:@selector(nl_handleControlEvents:withBlock:)];
  if (block) {
    self.enabled = NO;
    block();
    self.enabled = YES;
  }
}

@end
