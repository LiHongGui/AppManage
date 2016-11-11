//
//  AppModel.h
//  应用程序管理
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
@property(nonatomic,copy) NSString *size;
@property(nonatomic,copy) NSString *download;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;
#warning 记录是否点击
@property(nonatomic,assign,getter=isEnable) BOOL enable;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appModelWithDict:(NSDictionary *)dict;
@end
