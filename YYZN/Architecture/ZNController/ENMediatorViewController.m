//
//  ENMediatorViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  作为一个中间页,如果没有找到控制器就跳这个页面

#import "ENMediatorViewController.h"

@interface ENMediatorViewController ()

@end

@implementation ENMediatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"空白页";
    self.view.backgroundColor = [UIColor whiteColor];
    [EWHudTool showAlertViewWithMessage:[NSString stringWithFormat:@"url:%@,params:%@",self.originUrl,self.params]];
    
    self.titleName = @"123";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.reserveValue) {
        self.reserveValue(self.titleName);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
