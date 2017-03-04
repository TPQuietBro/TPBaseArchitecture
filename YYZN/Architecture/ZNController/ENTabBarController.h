//
//  ENTabBarController.h
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYZNTabBarView;
@interface ENTabBarController : UITabBarController
/**暴露底部tabbar,方便外部显示*/
@property (nonatomic , strong)YYZNTabBarView *tabBarView;
@end
