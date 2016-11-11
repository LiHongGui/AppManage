//
//  CollectionViewCell.m
//  collectionView应用管理
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CollectionViewModel.h"
@implementation CollectionViewCell


-(void)setModel:(CollectionViewModel *)model
{
    _model = model;
    
    _imageView.image = [UIImage imageNamed:model.icon];
    _label.text = model.name;
    NSLog(@"_imageView%f",_imageView.frame.size.width);
}

@end
