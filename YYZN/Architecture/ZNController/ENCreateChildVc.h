//
//  ENCreateChildVc.h
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ENCreateChildVc : NSObject
/*
 * 创建某个控制器的子控制器
 */
- (void)createChildVcWithTabVc:(UITabBarController *)vc;
/*
 * 得到子控制器的数组
 */
- (NSArray *)createChildVc;
@end
