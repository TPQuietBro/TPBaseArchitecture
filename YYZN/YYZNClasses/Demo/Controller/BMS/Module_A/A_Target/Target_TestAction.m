//
//  Target_TestAction.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "Target_TestAction.h"
#import "ENTest_AViewController.h"

@implementation Target_TestAction
- (UIViewController *)Action_getAViewController:(NSDictionary *)params{
    ENTest_AViewController *aVc = [[ENTest_AViewController alloc] init];
    aVc.userName = params[@"userName"];
    return aVc;
}
@end
