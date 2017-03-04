//
//  EWAPIManagerProtocal.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  该协议定义了每个manager里面应该实现的方法,可以返回请求的url,字典参数,请求类型

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,EWRequestType){
    EWAPIRequestTypeGet = 0,
    EWAPIRequestTypePost = 1,
    EWAPIRequestTypeUploadImage = 2
};
@protocol EWAPIManagerProtocol <NSObject>

@required
//请求方式
- (EWRequestType)requestType;
//请求的参数
- (NSDictionary *)params;
//请求的方法名
- (NSString *)requestMethod;
//请求后完整的拼接参数
- (NSDictionary*)paramsForAPI;

//一应智能会有自定义的requestheader
- (NSDictionary *)headerDict;

@optional

//物业接口可能会有membercode

- (NSString *)memberCode;


@end
