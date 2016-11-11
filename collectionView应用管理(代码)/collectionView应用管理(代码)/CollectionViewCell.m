//
//  CollectionViewCell.m
//  collectionView应用管理(代码)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CollectionViewModel.h"
@implementation CollectionViewCell

#pragma mark
#pragma mark -  设置frame--初始化一个新的对象
-(instancetype)initWithFrame:(CGRect)frame
{
    #warning 设置一个新的imageView,label frame
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        CGFloat margin = 10;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.contentView.bounds.size.width - 60)/2, margin, 60, 60)];
        //关联控件
        self.imageView = imageView;
        [self.contentView addSubview:imageView];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxX(_imageView.frame), self.contentView.bounds.size.width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        self.label = label;
        //添加到view上
        [self.contentView addSubview:label];
    }
    return self;
}
//重写
-(void)setModel:(CollectionViewModel *)model
{
    _model = model;
   _imageView.image = [UIImage imageNamed:model.icon];
    
    _label.text = model.name;
}
@end
