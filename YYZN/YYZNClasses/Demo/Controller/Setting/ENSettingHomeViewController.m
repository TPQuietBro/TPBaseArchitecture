//
//  ENSettingHomeViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENSettingHomeViewController.h"

@interface ENSettingHomeViewController ()

@end

@implementation ENSettingHomeViewController

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [ENShowTabBar showTarBar];
    [ENHomeNavigationBarTool showTopImageInVc:self];
    [self setNavigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"333";
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [ENHomeNavigationBarTool hideTopImageInVc:self];
}

#pragma mark - init method
- (void)setNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark - custom delegate

#pragma mark - API method

#pragma mark - getter


@end
