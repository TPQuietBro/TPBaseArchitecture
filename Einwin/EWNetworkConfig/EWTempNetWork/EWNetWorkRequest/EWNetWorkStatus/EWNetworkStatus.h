//
//  ENNetworkStatus.h
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  监控网络状态

#import <Foundation/Foundation.h>

@interface EWNetworkStatus : NSObject
/*
 * 开始检测
 */
+ (void)startMonitoring;
/*
 * 是否有网络
 */
+ (BOOL)networkOn;
@end
