//
//  ZNRequestAnimation.h
//  YYZN
//
//  Created by ccpg_it on 17/3/3.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  用于生成网络请求的动画

#import <Foundation/Foundation.h>

@interface ZNRequestAnimation : NSObject
//开始动画
+ (void)showHudAnimation;
//结束动画
+ (void)hideHudAtWindow;

@end
