//
//  EWAPIBaseManager.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  目的是定义一个基本的请求管理类,用于完成基本的请求任务

#import <Foundation/Foundation.h>
#import "EWAPICallBackProtocol.h"
#import "EWAPIManagerProtocol.h"
#import "EWDataFilterProtocol.h"
#import "EWResponse.h"

@interface EWAPIBaseManager : NSObject

//回调的代理,需要遵守EWAPICallBackProtocol协议
@property (nonatomic , weak) id<EWAPICallBackProtocol> delegate;

//遵守协议的子类,须遵守EWAPIManagerProtocol协议
@property (nonatomic , strong) NSObject<EWAPIManagerProtocol> *childManager;

//自定义response用来统一保存数据和error
@property (nonatomic , strong) EWResponse *response;

//外部传入的参数
@property (strong,nonatomic) NSMutableDictionary *outerParams;

//是否需要动画
@property (nonatomic , strong) NSDictionary *animationTargetAction;


//数据过滤的方法,必须要遵守EWDataFilterProtocol协议

- (id)filterDataWithFilter:(id<EWDataFilterProtocol>)filter;

//是否需要缓存
- (NSNumber *)shouldCache;
/**
 * 加载数据
 */
- (void)loadData;

/**
 * 取消请求
 */
- (void)cancelAllRequest;

@end
