//
//  EWRequestInstanceFactory.m
//  YYZN
//
//  Created by ccpg_it on 17/2/23.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWRequestInstanceFactory.h"

@implementation EWRequestInstanceFactory
static EWRequestInstanceFactory *singleton = nil;
+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (id)requestInstance:(NSString *)instance{
    id requestInstance = [[NSClassFromString(instance) alloc] init];
    
    //如果没有遵守请求的协议就返回nil
    if (![requestInstance conformsToProtocol:@protocol(EWNetworkRequestProtocol)]) {
        return nil;
    }
    
    return requestInstance;
}

@end
