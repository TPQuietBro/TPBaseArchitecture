//
//  JSONManager.h
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONManager : NSObject
+ (NSDictionary *)jsonToDictionary:(id)jsonString;
+ (NSString *)dictionaryToJson:(NSDictionary *)dict;
@end
