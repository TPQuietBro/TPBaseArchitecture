//
//  NSDictionary+DictToJSON.h
//  YYZN
//
//  Created by ccpg_it on 17/2/9.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONToDict)
/*
 * json转字典
 */
+ (NSDictionary *)jsonToDictionary:(id)jsonString;
/*
 * 拼接请求参数
 */
+ (NSDictionary *)getParamsDictWithURL:(NSString *)url paramsDict:(NSDictionary *)dict cacheTime:(NSNumber *)cacheTime headerDict:(NSDictionary *)headerDict;
@end
