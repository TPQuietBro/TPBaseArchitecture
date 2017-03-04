//
//  EngingKeyChain.h
//  静态库
//
//  Created by ccpg_it on 16/12/8.
//  Copyright © 2016年 tangpeng. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface EngingKeyChain : NSObject
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
@end
