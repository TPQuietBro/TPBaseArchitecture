//
//  ENHomeNavigationBarTool.m
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENHomeNavigationBarTool.h"

@implementation ENHomeNavigationBarTool
+ (void)showTopImageInVc:(UIViewController *)vc{
    ENNavigationController *nav = (ENNavigationController *)vc.navigationController;
    nav.topLogoImageView.hidden = NO;
    nav.topScanImageView.hidden = NO;
}

+ (void)hideTopImageInVc:(UIViewController *)vc{
    ENNavigationController *nav = (ENNavigationController *)vc.navigationController;
    nav.topLogoImageView.hidden = YES;
    nav.topScanImageView.hidden = YES;
}
@end
