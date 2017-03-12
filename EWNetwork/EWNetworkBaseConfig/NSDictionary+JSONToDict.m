//
//  NSDictionary+DictToJSON.m
//  YYZN
//
//  Created by ccpg_it on 17/2/9.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "NSDictionary+JSONToDict.h"
#import "EWConstFile.h"

@implementation NSDictionary (JSONToDict)
+ (NSDictionary *)jsonToDictionary:(id)jsonString{
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
}

+ (NSDictionary *)getParamsDictWithURL:(NSString *)url paramsDict:(NSDictionary *)dict cacheTime:(NSNumber *)cacheTime headerDict:(NSDictionary *)headerDict{
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
    [paramDict setValue:url forKey:EWRequestURLKey];
    [paramDict setValue:dict forKey:EWRequestDictKey];
    [paramDict setValue:cacheTime forKey:EWRequestCacheTimeKey];
    [paramDict setValue:headerDict forKey:EWRequestHeaderDictKey];
    return paramDict;
}

@end
