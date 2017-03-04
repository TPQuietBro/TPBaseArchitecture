//
//  Target_getScanVc.m
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  关于跳转时的操作都放在这里

#import "Target_getScanVc.h"
#import "ENScanQRCodeViewController.h"
@implementation Target_getScanVc
- (UIViewController *)Action_getScanViewController:(NSDictionary *)params{
    ENScanQRCodeViewController *scanVc = [[ENScanQRCodeViewController alloc] init];
    return scanVc;
}
@end
