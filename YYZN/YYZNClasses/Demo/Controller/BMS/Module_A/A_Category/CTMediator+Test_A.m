//
//  CTMediator+Test_A.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "CTMediator+Test_A.h"

NSString *const KENTargetA = @"TestAction";
NSString *const KENActionA = @"getAViewController";


@implementation CTMediator (Test_A)
- (UIViewController *)getTest_AViewController:(NSDictionary *)params{
    UIViewController *viewController = [self performTarget:KENTargetA action:KENActionA params:params shouldCacheTarget:NO];
//    if ([viewController isKindOfClass:[UIViewController class]]) {
//        return viewController;
//    }else{
//        return [[ENMediatorViewController alloc] init];
//    }
    return [ENJudgeVcTool judgeVc:viewController];
}
@end
