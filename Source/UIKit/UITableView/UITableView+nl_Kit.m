//
//  UITableView+nl_Kit.m
//  forums
//
//  Created by nathan@hoomic.com on 16/6/12.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import "UITableView+nl_Kit.h"

@implementation UITableView (nl_Kit)

+ (instancetype)nl_tableViewWithStyle:(UITableViewStyle)style builder:(void (^)(__kindof UITableView *tableView))builder {
  UITableView *tableView = [[self alloc] initWithFrame:CGRectZero style:style];
  if (builder) {
    builder(tableView);
  }
  return tableView;
}

@end
