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

#pragma mark - 网络配置

/**网络状态*/
UIKIT_EXTERN NSString *const KEWNetworkStatus;
/**网络请求方式*/
UIKIT_EXTERN NSString *const EWRequestMethodKey;
/**网络请求URL*/
UIKIT_EXTERN NSString *const EWRequestURLKey;
/**网络请求参数*/
UIKIT_EXTERN NSString *const EWRequestDictKey;
/**网络请求缓存时间*/
UIKIT_EXTERN NSString *const EWRequestCacheTimeKey;

/**用于保存物业membercode*/
UIKIT_EXTERN NSString *const EWRequestMemberCodeKey;
/**网络自定义request*/
UIKIT_EXTERN NSString *const EWRequestHeaderDictKey;

/**网络get请求*/
UIKIT_EXTERN NSString *const EWRequestTypeGet;
/**网络post请求*/
UIKIT_EXTERN NSString *const EWRequestTypePost;
/**上传image的key*/
UIKIT_EXTERN NSString *const EWUploadImageKey;
/**YTK请求*/
UIKIT_EXTERN NSString *const KEWRequestByYTK;
/**AFN请求*/
UIKIT_EXTERN NSString *const KEWRequestByAFN;

#pragma mark - 网络请求动画

UIKIT_EXTERN NSString *const EWRequestAnimationTarget;

UIKIT_EXTERN NSString *const EWShowHudAnimation;

UIKIT_EXTERN NSString *const EWHideHudAtWindow;

@end
