//
//  CollectionViewModel.h
//  应用管理(storyboard)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionViewModel : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)collectionViewModelWithDict:(NSDictionary *)dict;
@end
