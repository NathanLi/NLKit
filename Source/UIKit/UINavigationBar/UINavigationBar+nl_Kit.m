//
//  UINavigationBar+nl_Kit.m
//  forums
//
//  Created by nathan@hoomic.com on 15/11/17.
//  Copyright © 2015年 hoomic. All rights reserved.
//

#import "UINavigationBar+nl_Kit.h"

@implementation UINavigationBar (nl_Kit)

- (UIImageView *)nl_underHarilineImageView {  
  return [self.class nl_findHairlineImageViewUnder:self];
}

+ (UIImageView *)nl_findHairlineImageViewUnder:(UIView *)view {
  if ([view isKindOfClass:UIImageView.class] && CGRectGetHeight(view.bounds) <= 1.0) {
    return (UIImageView *)view;
  }
  
  for (UIView *subview in view.subviews) {
    UIImageView *imageView = [self nl_findHairlineImageViewUnder:subview];
    if (imageView) {
      return imageView;
    }
  }
  
  return nil;
}

@end
