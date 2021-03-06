//
//  AppModel.m
//  应用程序管理
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
