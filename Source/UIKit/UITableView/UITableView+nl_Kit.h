//
//  UITableView+nl_Kit.h
//  forums
//
//  Created by nathan@hoomic.com on 16/6/12.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (nl_Kit)

+ (instancetype)nl_tableViewWithStyle:(UITableViewStyle)style builder:(void (^)(__kindof UITableView *tableView))builder;

@end
