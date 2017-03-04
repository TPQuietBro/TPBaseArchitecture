//
//  ENShowTabBar.m
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENShowTabBar.h"
#import "ENTabBarController.h"
#import "YYZNTabBarView.h"

@implementation ENShowTabBar
+ (void)showTarBar{
        ENTabBarController *tabVc = (ENTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        tabVc.tabBarView.hidden = NO;
}
@end
