//
//  UIPickerView+nl_Kit.m
//  forums
//
//  Created by nathan@hoomic.com on 16/4/29.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import "UIPickerView+nl_Kit.h"
#import "NSObject+nl_Kit.h"
#import "UIView+nl_Kit.h"

@interface UIPickerView (nl_private) <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray<NSString *> *nl_datas;
@property (nonatomic, strong) NSArray<NSString *> *nl_datas2;
@property (nonatomic, assign) NSInteger nl_currentRow;
@property (nonatomic, assign) NSInteger nl_currentComponent;

@property (nonatomic, strong, readonly) UIView *nl_viewBackground;

@end

@implementation UIPickerView (nl_private)
+ (void)load {
  [self nl_swizzleMethod:@selector(selectRow:inComponent:animated:) withMethod:@selector(nl_selectRow:inComponent:animated:)];
}

- (void)nl_selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated {
  self.nl_currentRow = row;
  self.nl_currentComponent = component;
  
  [self nl_selectRow:row inComponent:component animated:animated];
}


- (void)setNl_datas:(NSArray<NSString *> *)nl_datas {
  [self nl_setAssociateValue:nl_datas withKey:@selector(nl_datas)];
}

- (void)setNl_datas2:(NSArray<NSString *> *)nl_datas {
  [self nl_setAssociateValue:nl_datas withKey:@selector(nl_datas2)];
}

- (NSArray<NSString *> *)nl_datas {
  return [self nl_associatedValueForKey:_cmd];
}

- (NSArray<NSString *> *)nl_datas2 {
  return [self nl_associatedValueForKey:_cmd];
}

- (NSInteger)nl_currentRow {
  return [[self nl_associatedValueForKey:_cmd] integerValue];
}

- (void)setNl_currentRow:(NSInteger)nl_currentRow {
  [self nl_setAssociateValue:@(nl_currentRow) withKey:@selector(nl_currentRow)];
}

- (NSInteger)nl_currentComponent {
  return [[self nl_associatedValueForKey:_cmd] integerValue];
}

- (void)setNl_currentComponent:(NSInteger)nl_currentComponent {
  [self nl_setAssociateValue:@(nl_currentComponent) withKey:@selector(nl_currentComponent)];
}

- (UIView *)nl_viewBackground {
  UIView *view = [self nl_associatedValueForKey:_cmd];
  if (!view) {
    view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    __weak typeof(self) weakSelf = self;
    [view nl_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
      __strong typeof(weakSelf) self = weakSelf;
      
      [self nl_hide];
    }];
    
    [self nl_setAssociateValue:view withKey:_cmd];
  }
  return view;
}



#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  if (self.nl_datas2.count > 0) {
    return 2;
  }
  else {
    return 1;
  }
  
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  if (component == 0) {
    return [self.nl_datas count];
  }
  else {
    return [self.nl_datas2 count];
  }
  
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  
  if (component == 0) {
    return self.nl_datas[row];
  }
  else {
    return self.nl_datas2[row];
  }
}


#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  self.nl_currentRow = row;
  self.nl_currentComponent = component;
  
  if (self.nl_didSelectBlock) {
    self.nl_didSelectBlock(row, component);
  }
  
  [[self.nl_toolbar.items lastObject] setEnabled:YES];
}
@end

@implementation UIPickerView (nl_Kit)

- (void)nl_clickCancel {
  [self nl_hide];
}

- (void)nl_clickDone {
  if (self.nl_userDidTapDoneBlock) {
    self.nl_userDidTapDoneBlock(self.nl_currentRow, self.nl_currentComponent);
  }
  
  [self nl_hide];
}

- (void)nl_clickLeftBtn {
  if (self.nl_userDidTapLeftBtnBlock) {
    self.nl_userDidTapLeftBtnBlock(self.nl_currentRow, self.nl_currentComponent);
  }
  
  [self nl_hide];
}

- (void)nl_clickDoneNoHide {
  if (self.nl_userDidTapDoneBlock) {
    self.nl_userDidTapDoneBlock(self.nl_currentRow, self.nl_currentComponent);
  }
  
  
  [self.nl_viewBackground removeFromSuperview];
  [self.nl_toolbar removeFromSuperview];
  
  [self removeFromSuperview];
  //[self nl_hide];
}

- (UIToolbar *)nl_toolbar {
  UIToolbar *toolbar = [self nl_associatedValueForKey:_cmd];
  if (!toolbar) {
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(.0, .0, CGRectGetWidth([UIScreen mainScreen].bounds), 44.0)];
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *itemCancel = [[UIBarButtonItem alloc] initWithTitle:@"  取消" style:UIBarButtonItemStylePlain target:self action:@selector(nl_clickCancel)];
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:@"完成  " style:UIBarButtonItemStylePlain target:self action:@selector(nl_clickDone)];
    itemDone.enabled = NO;
    
    [toolbar setItems:@[itemCancel, flexiableItem, itemDone]];
    [self nl_setAssociateValue:toolbar withKey:_cmd];
  }
  return toolbar;
}

- (void)setNl_toolbar:(UIToolbar *)toolbar Title:(NSString *)title leftTitle:(NSString*)title1 rightTitle:(NSString *)title2 {
  
  [toolbar setItems:nil];
  UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
  UIBarButtonItem *itemTitle1 = [[UIBarButtonItem alloc] initWithTitle:title1 style:UIBarButtonItemStylePlain target:self action:@selector(nl_clickLeftBtn)];
  UIBarButtonItem *itemTitle = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:nil];
  UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:title2 style:UIBarButtonItemStylePlain target:self action:@selector(nl_clickDoneNoHide)];
  
  [toolbar setItems:@[itemTitle1, flexiableItem, itemTitle, flexiableItem, itemDone]];

}

- (void (^)(NSInteger, NSInteger))nl_userDidTapLeftBtnBlock {
  return [self nl_associatedValueForKey:_cmd];
}

- (void)setNl_userDidTapLeftBtnBlock:(void (^)(NSInteger, NSInteger))nl_userDidTapLeftBtnBlock {
  [self nl_setAssociateValue:nl_userDidTapLeftBtnBlock withKey:@selector(nl_userDidTapLeftBtnBlock)];
}

- (void (^)(NSInteger, NSInteger))nl_userDidTapDoneBlock {
  return [self nl_associatedValueForKey:_cmd];
}

- (void)setNl_userDidTapDoneBlock:(void (^)(NSInteger, NSInteger))nl_userDidTapDoneBlock {
  [self nl_setAssociateValue:nl_userDidTapDoneBlock withKey:@selector(nl_userDidTapDoneBlock)];
}

- (void (^)(NSInteger, NSInteger))nl_didSelectBlock {
  return [self nl_associatedValueForKey:_cmd];
}

- (void)setNl_didSelectBlock:(void (^)(NSInteger, NSInteger))nl_didSelectBlock {
  [self nl_setAssociateCopyValue:nl_didSelectBlock withKey:@selector(nl_didSelectBlock)];
}

- (void)reloadWithDatas:(NSArray<NSString *> *)strings {
  self.nl_datas = strings;
  
  self.dataSource = self;
  self.delegate = self;
}

- (void)reloadWithDatas:(NSArray<NSString *> *)strings Datas2:(NSArray<NSString *> *)strings2 Title:(NSString *)title leftTitle:(NSString *)title1 rightTitle:(NSString *)title2 {
  
  [self setNl_toolbar:self.nl_toolbar Title:title leftTitle:title1 rightTitle:title2];
  
  self.nl_datas = strings;
  self.nl_datas2 = strings2;
  
  self.dataSource = self;
  self.delegate = self;
  
  
}

- (void)nl_showInView:(UIView *)view Title:(NSString *)title leftTitle:(NSString *)title1 rightTitle:(NSString *)title2 {
  [view addSubview:self.nl_viewBackground];
  [view addSubview:self.nl_toolbar];
  [view addSubview:self];
  
  [self setNl_toolbar:self.nl_toolbar Title:title leftTitle:title1 rightTitle:title2];
  
  self.nl_toolbar.nl_top = view.nl_bottom;
  self.nl_top = self.nl_toolbar.nl_bottom;
  self.nl_viewBackground.nl_size = view.nl_size;
  
  [UIView animateWithDuration:0.3 animations:^{
    self.nl_top = view.nl_bottom - self.nl_height;
    self.nl_toolbar.nl_top = view.nl_bottom - self.nl_height - self.nl_toolbar.nl_height;
  } completion:^(BOOL finished) {
    
  }];
}

- (void)nl_showInView:(UIView *)view {
  [view addSubview:self.nl_viewBackground];
  [view addSubview:self.nl_toolbar];
  [view addSubview:self];
  
  self.nl_toolbar.nl_top = view.nl_bottom;
  self.nl_top = self.nl_toolbar.nl_bottom;
  self.nl_viewBackground.nl_size = view.nl_size;
  
  [UIView animateWithDuration:0.3 animations:^{
    self.nl_top = view.nl_bottom - self.nl_height;
    self.nl_toolbar.nl_top = view.nl_bottom - self.nl_height - self.nl_toolbar.nl_height;
  } completion:^(BOOL finished) {
    
  }];
}

- (void)nl_hide {
  [UIView animateWithDuration:0.3 animations:^{
    self.nl_toolbar.nl_top = self.superview.nl_bottom;
    self.nl_top = self.nl_toolbar.nl_bottom;
  } completion:^(BOOL finished) {
    [self.nl_viewBackground removeFromSuperview];
    [self.nl_toolbar removeFromSuperview];
    [self removeFromSuperview];
  }];
}

@end
