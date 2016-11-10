//
//  ViewController.m
//  应用程序管理
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppCell.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UINavigationController
}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"apps_full.plist" ofType:nil];
        NSMutableArray *mutb = [NSMutableArray array];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        for (NSDictionary *dict in temp) {
            AppModel *model = [AppModel appModelWithDict:dict];
            [mutb addObject:model];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AppCell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[AppCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    AppModel *appModel = self.dataArray[indexPath.row];
    cell.model = appModel;
    return cell;
}

@end
