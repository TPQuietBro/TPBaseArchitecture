//
//  EWAPIRequest.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EWResponse;
@interface EWAPIRequest : NSObject
/**
 * 单例
 */
+ (instancetype)requestManager;

/**
 * 取消请求
 */
- (void)cancelRequest;
/**
 *  get请求
 *
 *  @param params 传入的参数,必须包含url,请求类型,参数,以及cache时间(没有就填@0)
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
- (NSURLSessionDataTask *)sendRequestByGetWithParams:(NSDictionary *)params success:(void (^)(EWResponse *))success fail:(void (^)(EWResponse *))failure;
/**
 *  post请求
 *
 *  @param params 传入的参数,必须包含url,请求类型,参数,以及cache时间(没有就填@0)
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
- (NSURLSessionDataTask *)sendRequestByPostWithParams:(NSDictionary *)params success:(void (^)(EWResponse *))success fail:(void (^)(EWResponse *))failure;

/**
 *  图片上传
 *
 *  @param params 传入的参数,必须包含url,图片内容,图片key为EWUploadImageKey
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
- (NSURLSessionDataTask *)sendRequestByPostImageWithParams:(NSDictionary *)params success:(void (^)(EWResponse *))success fail:(void (^)(EWResponse *))failure;
@end
