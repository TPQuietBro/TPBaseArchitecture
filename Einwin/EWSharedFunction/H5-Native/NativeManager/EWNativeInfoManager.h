//
//  ENNativeInfoManager.h
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  获取本地相关信息回调到js端

#import <Foundation/Foundation.h>
@class JSContext;
@interface EWNativeInfoManager : NSObject
/*
 * 获取本地用户信息
 */
+ (void)getNativeAccountInfoByJSContext:(JSContext *)context;

@end
