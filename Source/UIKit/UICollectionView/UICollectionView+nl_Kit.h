//
//  UICollectionView+nl_Kit.h
//  forums
//
//  Created by nathan@hoomic.com on 16/7/5.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (nl_Kit)

+ (_Nonnull instancetype)nl_viewWithLayout:(UICollectionViewLayout * _Nonnull)layout builder:(void (^ _Nullable )(__kindof UICollectionView * _Nonnull collectionView))builder;

@end
