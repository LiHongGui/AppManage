//
//  ViewController.m
//  collectionView应用管理
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewModel.h"
#import "CollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@end

static NSString *identifier = @"CollectionViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    //设置间距
    _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    [_collectionView setBackgroundColor:[UIColor blackColor]];
    
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
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    CollectionViewModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    UIView *selectView = [[UIView alloc]initWithFrame:cell.bounds];
    selectView.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = selectView;
    
    

    return cell;
}
@end
