//
//  EWResponse.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EWResponse : NSObject
//请求的数据
@property (nonatomic , strong) id responseObject;
//请求的原始数据
@property (nonatomic , strong) NSData *responseData;
//请求错误
@property (nonatomic , strong) NSError *error;

/**
 * 初始化方法,如果是AFN那么用这个方法
 */
- (instancetype)initWithResopnseObject:(id)responseObject andError:(NSError *)error;
/**
 * 初始化方法,如果是用原生那么用这个方法
 */
- (instancetype)initWithData:(NSData *)data andError:(NSError *)error;

@end
