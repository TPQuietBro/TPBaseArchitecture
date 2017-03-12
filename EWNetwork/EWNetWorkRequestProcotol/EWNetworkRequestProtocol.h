//
//  EWNetworkRequestProtocal.h
//  YYZN
//
//  Created by ccpg_it on 17/2/23.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  遵循该协议实现网络请求的方法

#import <Foundation/Foundation.h>

@protocol EWNetworkRequestProtocol <NSObject>

@required
- (NSURLSessionDataTask *)requestByGetWithParams:(NSDictionary *)params success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))failure;

- (NSURLSessionDataTask *)requestByPostWithParams:(NSDictionary *)params success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))failure;

/*
 * 这个方法中字典必须包含url和图片内容,统一设置key为EWRequestURLKey和EWUploadImageKey;
 */
- (NSURLSessionDataTask *)uploadImageByPostWithParams:(NSDictionary *)params success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))failure;

@end
