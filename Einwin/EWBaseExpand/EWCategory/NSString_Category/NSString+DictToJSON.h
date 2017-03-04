//
//  NSString+DictToJSON.h
//  YYZN
//
//  Created by ccpg_it on 17/2/9.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DictToJSON)
+ (NSString *)dictionaryToJson:(NSDictionary *)dict;
@end
