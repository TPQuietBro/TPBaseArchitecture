//
//  ENJudgeVcTool.m
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENJudgeVcTool.h"

@implementation ENJudgeVcTool
+ (UIViewController *)judgeVc:(id)vc{
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }else{
        return [[ENMediatorViewController alloc] init];
    }
}
@end
