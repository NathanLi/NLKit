//
//  HoomicTool.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-1-6.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UITableView+HoomicTool.h"

@implementation UITableView (HoomicTool)

- (void)deselectForSelectedRowWithAnimation:(BOOL)animation {
  NSIndexPath *indexPath = [self indexPathForSelectedRow];
  if (indexPath) {
    [self deselectRowAtIndexPath:indexPath animated:animation];
  }
}

@end
