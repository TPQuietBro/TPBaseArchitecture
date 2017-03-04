//
//  ENBaseViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  作为基类,除了首页三个控制器后面的控制器都继承这个类,主要是为了控制器导航条的样式

#import "ENBaseViewController.h"
#import "UIBarButtonItem+item.h"

@interface ENBaseViewController ()

@end

@implementation ENBaseViewController
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBar];
}

#pragma mark - init methods

- (void)setNavgationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] HighlightImage:[UIImage imageNamed:@"back_select"] Target:self Action:@selector(clickBack)];
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header"] forBarMetrics:UIBarMetricsDefault];
    
}

#pragma mark - event response

- (void)clickBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
