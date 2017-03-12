//
//  NSUserDefaults+ValueOperation.h
//  user
//
//  Created by ccpg_it on 16/12/7.
//  Copyright © 2016年 CCPG. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface NSUserDefaults (ValueOperation)

/**根据flag存储偏好值*/
+ (void)setValueWithFlag:(NSString *)flag Value:(id)value;

/**根据flag删除偏好值*/
+ (void)deleteFlagFromVc:(NSString *)flag;

/**根据flag得到偏好值*/
+ (NSString *)getFlagFromVc:(NSString *)flag;

/**根据flag判断偏好值是否存在*/
+ (BOOL)isFlagLive:(NSString *)flag;

@end
