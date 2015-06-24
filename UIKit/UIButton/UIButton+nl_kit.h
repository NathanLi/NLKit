//
//  UIButton+nl_kit.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-18.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Color.h"
#import "UIButton+nl_Block.h"

@interface UIButton (nl_kit)

@property (strong, nonatomic) UIImage *nl_image;
@property (strong, nonatomic) UIImage *nl_imageHighlighted;
@property (strong, nonatomic) NSString *nl_title;
@property (strong, nonatomic) NSString *nl_titleHighlighted;
@property (strong, nonatomic) UIImage *nl_backgroundImage;
@property (strong, nonatomic) UIImage *nl_backgroundImageHighlighted;
@end

@interface UIButton (nl_VerticalLayout)

- (void)nl_centerVerticallyWithPadding:(float)padding;
- (void)nl_centerVertically;

@end
