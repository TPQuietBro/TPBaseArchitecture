//
//  ENCreateChildVc.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENCreateChildVc.h"
#import "ENBMSHomeViewController.h"
#import "ENCSSHomeViewController.h"
#import "ENSettingHomeViewController.h"
#import "ENNavigationController.h"
#import "ENTabBarController.h"

@implementation ENCreateChildVc
/*
 * 返回子控制器
 */
- (void)createChildVcWithTabVc:(ENTabBarController *)vc{
    ENBMSHomeViewController *BMSVc = [[ENBMSHomeViewController alloc] init];
    [self setOneChildVc:BMSVc inSuperVc:vc];
    
    ENCSSHomeViewController *CSSVc = [[ENCSSHomeViewController alloc] init];
    [self setOneChildVc:CSSVc inSuperVc:vc];
    
    ENSettingHomeViewController *settingVc = [[ENSettingHomeViewController alloc] init];
    [self setOneChildVc:settingVc inSuperVc:vc];
}
/*
 * 导航控制器包装
 */
- (void)setOneChildVc:(UIViewController *)vc inSuperVc:(ENTabBarController *)superVc{
    ENNavigationController *nav = [[ENNavigationController alloc] initWithRootViewController:vc];
    [superVc addChildViewController:nav];
}

#pragma mark -
/*---------------------------------------*/
- (NSArray *)createChildVc{
    
    ENBMSHomeViewController *BMSVc = [[ENBMSHomeViewController alloc] init];
  
    ENCSSHomeViewController *CSSVc = [[ENCSSHomeViewController alloc] init];

    ENSettingHomeViewController *settingVc = [[ENSettingHomeViewController alloc] init];
    
    return @[[self setOneChildVc:BMSVc],[self setOneChildVc:CSSVc],[self setOneChildVc:settingVc]];
}

- (id)setOneChildVc:(UIViewController *)vc{
    ENNavigationController *nav = [[ENNavigationController alloc] initWithRootViewController:vc];
    return nav;
}




@end
