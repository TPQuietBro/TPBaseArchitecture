//
//  Target_ModuleB.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "Target_ModuleB.h"
#import "ENTest_BViewController.h"

@implementation Target_ModuleB
- (UIViewController *)Action_getBViewController:(NSDictionary *)params{
    ENTest_BViewController *bVc = [[ENTest_BViewController alloc] init];
    return bVc;
}
@end
