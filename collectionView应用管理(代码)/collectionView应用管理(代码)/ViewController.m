//
//  ViewController.m
//  collectionView应用管理(代码)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewModel.h"
#import "CollectionViewCell.h"
//代理协议
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
//@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSArray *dataArray;
@end
static NSString *identifier = @"collectionView";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    #warning 手动创建一个collectionView
    /*
     1.初始化collectionView
     2.设置代理
     3.注册cell
     */
    //    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
#warning 实例化一个CollectionViwe
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:_flowLayout];
    //实现协议代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    _flowLayout.itemSize = CGSizeMake(90, 90);
    _flowLayout.minimumInteritemSpacing = 10;
    _flowLayout.minimumLineSpacing = 10;
    collectionView.backgroundColor = [UIColor whiteColor];
    #warning 注册cell
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:collectionView];
}
-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *mutb = [NSMutableArray array];
        for (NSDictionary *dict in temp) {
            CollectionViewModel *model = [CollectionViewModel collectionViewModelWithDict:dict];
            [mutb addObject:model];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        CollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    CollectionViewModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    UIView *view = [[UIView alloc]initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view;
    return cell;
}
@end
