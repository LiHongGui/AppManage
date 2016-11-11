//
//  AppCell.m
//  应用程序管理
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
@implementation AppCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setModel:(AppModel *)model
{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:model.icon];
    _nameLabel.text = model.name;
    _sizeLabel.text = [NSString stringWithFormat:@"大小:%@|下载量:%@",model.size,model.download];
    //否定;还没有下载
    _downButton.enabled = !model.isEnable;
    
}

- (IBAction)downButton:(UIButton *)sender {
    _downButton.enabled = NO;
    //已经下载
    _model.enable = YES;
}

@end
