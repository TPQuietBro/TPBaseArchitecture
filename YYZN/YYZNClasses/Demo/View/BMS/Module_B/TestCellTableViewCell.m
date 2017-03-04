//
//  TestCellTableViewCell.m
//  YYZN
//
//  Created by ccpg_it on 17/2/8.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "TestCellTableViewCell.h"
#import "TestItem.h"

@interface TestCellTableViewCell()
@property (nonatomic , strong) UIImageView *iconView;
@property (nonatomic , strong) UILabel *titleLabel;
@end

@implementation TestCellTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setLabelTitle:(NSString *)labelTitle{
    _labelTitle = labelTitle;
    self.titleLabel.text = labelTitle;
}

- (void)setImagePath:(NSString *)imagePath{
    _imagePath = imagePath;
    NSString *url = @"http://120.25.226.186:32812";
    NSString *urlStr = [url stringByAppendingPathComponent:imagePath];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
}

- (void)setup{
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor redColor];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40 * WidthFor1080);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60 * WidthFor1080, 60 * HeightFor1920));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(20 * WidthFor1080);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(40 * WidthFor1080);
        make.height.mas_equalTo(60 * HeightFor1920);
    }];
}

@end
