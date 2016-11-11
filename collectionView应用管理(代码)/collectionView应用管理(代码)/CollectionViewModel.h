//
//  CollectionViewModel.h
//  collectionView应用管理(代码)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionViewModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)collectionViewModelWithDict:(NSDictionary *)dict;
@end
