//
//  CTMediator+MoudleB.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "CTMediator+MoudleB.h"
NSString *const KENTargetB = @"ModuleB";
NSString *const KENActionB = @"getBViewController";
@implementation CTMediator (MoudleB)
- (UIViewController *)getTest_BViewController:(NSDictionary *)params{
    UIViewController *viewController = [self performTarget:KENTargetB action:KENActionB params:params shouldCacheTarget:NO];
    return [ENJudgeVcTool judgeVc:viewController];
}
@end
