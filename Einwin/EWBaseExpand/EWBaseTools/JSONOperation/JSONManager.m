//
//  JSONManager.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "JSONManager.h"

@implementation JSONManager
+ (NSDictionary *)jsonToDictionary:(id)jsonString{
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
}

+ (NSString *)dictionaryToJson:(NSDictionary *)dict{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonResult = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonResult;
}
@end
