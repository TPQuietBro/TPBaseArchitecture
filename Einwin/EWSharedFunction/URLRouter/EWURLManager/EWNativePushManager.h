//
//  ENNativePushTool.h
//  URL跳转
//
//  Created by ccpg_it on 16/10/12.
//  Copyright © 2016年 ccpg_it. All rights reserved.
//  通过URL进行跳转

#import <Foundation/Foundation.h>

@interface EWNativePushManager : NSObject

+ (instancetype)shareInstance;
/**根据url跳转*/
+ (void)PushEningViewController:(NSString *)url animated:(BOOL)yes reverseBlock:(void(^)(id))reverse;

+ (void)PushEningViewController:(NSString *)url Param:(NSDictionary *)param animated:(BOOL)yes;
/**退回几层控制器*/
+ (void)PushEningViewControllerWithTimes:(NSInteger)times animated:(BOOL)yes;

@end
