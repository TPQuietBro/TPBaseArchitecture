//
//  CTMediator+Login.m
//  YYZN
//
//  Created by CCPG_iOS on 2017/3/2.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "CTMediator+Login.h"

NSString *const KENTargetAa = @"TestAction";
NSString *const KENActionAa = @"getAViewController";

@implementation CTMediator (Login)
- (UIViewController *)jumpTomainViewController:(NSDictionary *)params{
        UIViewController *viewController = [self performTarget:KENTargetAa action:KENActionAa params:params shouldCacheTarget:NO];

        return [ENJudgeVcTool judgeVc:viewController];
}
@end
