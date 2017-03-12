//
//  EWRequestInstanceFactory.h
//  YYZN
//
//  Created by ccpg_it on 17/2/23.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  工厂类的作用是返回哪个网络库请求方法的实例

#import <Foundation/Foundation.h>
#import "EWNetworkRequestProtocol.h"

@interface EWRequestInstanceFactory : NSObject

//调用的单例
+ (instancetype)shareInstance;

- (id)requestInstance:(NSString *) instance;


@end
