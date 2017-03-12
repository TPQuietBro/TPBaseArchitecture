//
//  YYSHConstFile.h
//  YYSHDemo
//
//  Created by ccpg_it on 16/11/24.
//  Copyright © 2016年 ccpg_it. All rights reserved.
//  存放常用的常量字符串或者基本数据类型

#import <UIKit/UIKit.h>

@interface EWConstFile : NSObject
UIKIT_EXTERN NSString * const YYSHBarbuttonDidRepeatClickNotification;

UIKIT_EXTERN NSInteger const tarBarButtonCount;

UIKIT_EXTERN NSInteger const tarBarButtonTag;

UIKIT_EXTERN NSInteger const tarBarHeight;

UIKIT_EXTERN NSInteger const navigationBarHeight;
/**url请求地址*/
#pragma mark - url请求地址
/**社商一应云*/
UIKIT_EXTERN NSString *const EWHostStringForBusiness;
/**物业收费云*/
UIKIT_EXTERN NSString *const EWHostStringForProperty;
/**智能*/
UIKIT_EXTERN NSString *const EWHostStringForIntelligence;


@end
