//
//  NSString+DictToJSON.m
//  YYZN
//
//  Created by ccpg_it on 17/2/9.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "NSString+DictToJSON.h"

@implementation NSString (DictToJSON)
+ (NSString *)dictionaryToJson:(NSDictionary *)dict{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonResult = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonResult;
}
@end
