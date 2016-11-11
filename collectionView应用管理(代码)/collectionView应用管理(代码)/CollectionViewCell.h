//
//  CollectionViewCell.h
//  collectionView应用管理(代码)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionViewModel;
@interface CollectionViewCell : UICollectionViewCell
@property(nonatomic,weak) UIImageView *imageView;
@property(nonatomic,weak) UILabel *label;
@property(nonatomic,strong) CollectionViewModel *model;
@end
