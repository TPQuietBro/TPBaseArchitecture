//
//  ENTest_AViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENTest_AViewController.h"

@interface ENTest_AViewController ()

@property (nonatomic , strong) UIButton  *button;

@end

@implementation ENTest_AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
    self.view.backgroundColor = [UIColor whiteColor];
    [EWHudTool showAlertViewWithMessage:[NSString stringWithFormat:@"传递的参数:%@",self.userName]];
    [self.view addSubview:self.button];
    [self setButtonFrame];
}

#pragma mark - init methods

- (void)setButtonFrame{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(44);
        make.size.mas_equalTo(CGSizeMake(90, 30));
    }];
}

- (void)click:(UIButton *)sender{
    SLog(@"点击了按钮");
}

#pragma mark - getter

- (UIButton *)button{
    EW_WeakSelf
    if (!_button) {
        _button = [[UIButton alloc] initWithCallBackButtonClickBlock:^(UIButton *button) {
            [weakSelf click:button];
        }];
//        [_button setBackgroundColor:[UIColor redColor]];
        _button.en_bgColor([UIColor  redColor]);
    }
    return _button;
}
@end
