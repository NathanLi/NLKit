//
//  UIPickerView+nl_Kit.h
//  forums
//
//  Created by nathan@hoomic.com on 16/4/29.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPickerView (nl_Kit)

@property (nonatomic, copy) void (^nl_didSelectBlock)(NSInteger row, NSInteger component);
@property (nonatomic, strong, readonly) UIToolbar *nl_toolbar;
@property (nonatomic, copy) void (^nl_userDidTapDoneBlock)(NSInteger row, NSInteger component);
@property (nonatomic, copy) void (^nl_userDidTapLeftBtnBlock)(NSInteger row, NSInteger component);

- (void)reloadWithDatas:(NSArray<NSString *> *)strings;
- (void)reloadWithDatas:(NSArray<NSString *> *)strings Datas2:(NSArray<NSString *> *)strings2 Title:(NSString *)title leftTitle:(NSString *)title1 rightTitle:(NSString *)title2;

- (void)nl_showInView:(UIView *)view;
- (void)nl_showInView:(UIView *)view Title:(NSString *)title leftTitle:(NSString *)title1 rightTitle:(NSString *)title2;


- (void)nl_hide;

@end
