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

@property (strong, nonatomic) UIImage *_Nullable nl_image;
@property (strong, nonatomic) UIImage *_Nullable nl_imageHighlighted;
@property (strong, nonatomic) NSString *_Nullable nl_title;
@property (nonatomic, strong) UIColor *_Nullable nl_titleColor;
@property (strong, nonatomic) NSString *_Nullable nl_titleHighlighted;
@property (strong, nonatomic) UIImage *_Nullable nl_backgroundImage;
@property (strong, nonatomic) UIImage *_Nullable nl_backgroundImageHighlighted;

@property (nonatomic, strong) UIFont *_Nullable nl_font;

// when the button at screen bottom, it's will not auto highlight when user click.
// bug info: http://stackoverflow.com/questions/23046539/uibutton-fails-to-properly-register-touch-in-bottom-region-of-iphone-screen/23787144#23787144
- (void)nl_resolveSystemEdgeUnhighlighted;

+ (instancetype _Nonnull)nl_buttonWithBuildBlock:(void (^_Nullable)(__kindof UIButton *_Nonnull button))buildBlock;

@end

@interface UIButton (nl_VerticalLayout)

- (void)nl_centerVerticallyWithPadding:(float)padding;
- (void)nl_centerVertically;

@end
