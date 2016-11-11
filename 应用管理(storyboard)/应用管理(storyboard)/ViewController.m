//
//  ViewController.m
//  应用管理(storyboard)
//
//  Created by lihonggui on 2016/11/11.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewModel.h"
#import "CollectionViewCell.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
static NSString *identifier = @"CollectionViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
