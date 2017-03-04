//
//  CTMediator+Scan.m
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  扫描组件化的分类

#import "CTMediator+Scan.h"

NSString *const KENTargetForScan = @"getScanVc";
NSString *const KENActionForScan = @"getScanViewController";

@implementation CTMediator (Scan)
- (UIViewController *)getScanViewController{
    UIViewController *scanVc = [self performTarget:KENTargetForScan action:KENActionForScan params:nil shouldCacheTarget:NO];
    return [ENJudgeVcTool judgeVc:scanVc];
    //return scanVc;
}
@end
