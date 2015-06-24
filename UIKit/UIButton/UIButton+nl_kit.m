//
//  UIButton+NL_Samplify.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-18.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIButton+nl_kit.h"

@implementation UIButton (nl_kit)

- (void)setNl_image:(UIImage *)nl_image {
  /**
   *  @brief  In ios7.1 UiButton set image not working?
   *          see:http://stackoverflow.com/questions/22471182/in-ios7-1-uibutton-set-image-not-working
   */
  BOOL shouldEnable = self.enabled;
  self.enabled = YES;
  [self setImage:nl_image forState:UIControlStateNormal];
  self.enabled = shouldEnable;
}

- (void)setNl_imageHighlighted:(UIImage *)nl_imageHighlighted {
  [self setImage:nl_imageHighlighted forState:UIControlStateHighlighted];
}

- (UIImage *)nl_imageHighlighted {
  return [self imageForState:UIControlStateHighlighted];
}

- (void)setNl_title:(NSString *)nl_title {
  BOOL shouldEnable = self.enabled;
  self.enabled = YES;
  [self setTitle:nl_title forState:UIControlStateNormal];
  self.enabled = shouldEnable;

}

- (void)setNl_titleHighlighted:(NSString *)nl_titleHighlighted {
  [self setTitle:nl_titleHighlighted forState:UIControlStateHighlighted];
}

- (NSString *)nl_titleHighlighted {
  return [self titleForState:UIControlStateHighlighted];
}

- (UIImage *)nl_image {
  return [self imageForState:UIControlStateNormal];
}

- (NSString *)nl_title {
  return [self titleForState:UIControlStateNormal];
}

- (UIImage *)nl_backgroundImage {
  return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setNl_backgroundImage:(UIImage *)nl_backgroundImage {
  [self setBackgroundImage:nl_backgroundImage forState:UIControlStateNormal];
}

- (UIImage *)nl_backgroundImageHighlighted {
  return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)setNl_backgroundImageHighlighted:(UIImage *)nl_backgroundImageHighlighted {
  [self setBackgroundImage:nl_backgroundImageHighlighted forState:UIControlStateHighlighted];
}

@end

@implementation UIButton (nl_VerticalLayout)

- (void)nl_centerVerticallyWithPadding:(float)padding
{
  CGSize imageSize = self.imageView.frame.size;
  CGSize titleSize = self.titleLabel.frame.size;
  
  CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
  CGFloat imageWidth = MIN(imageSize.width, CGRectGetWidth(self.bounds));
  CGFloat titleWidth = MIN(titleSize.width, CGRectGetWidth(self.bounds));
  
  
  self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height),
                                          0.0f,
                                          0.0f,
                                          - titleWidth);
  
  self.titleEdgeInsets = UIEdgeInsetsMake(0.0f,
                                          - imageWidth,
                                          - (totalHeight - titleSize.height),
                                          0.0f);
  
}


- (void)nl_centerVertically
{
  const CGFloat kDefaultPadding = 6.0f;
  
  [self nl_centerVerticallyWithPadding:kDefaultPadding];
}


@end
