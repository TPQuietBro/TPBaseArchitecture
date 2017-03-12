//
//  NSUserDefaults+ValueOperation.m
//  user
//
//  Created by ccpg_it on 16/12/7.
//  Copyright © 2016年 CCPG. All rights reserved.
//

#import "NSUserDefaults+ValueOperation.h"

@implementation NSUserDefaults (ValueOperation)

+ (void)setValueWithFlag:(NSString *)flag Value:(id)value{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:flag];
}

+ (void)deleteFlagFromVc:(NSString *)flag{
    if ([self isFlagLive:flag]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:flag];
    }
}

+ (NSString *)getFlagFromVc:(NSString *)flag{
    return [[NSUserDefaults standardUserDefaults] objectForKey:flag] ? [[NSUserDefaults standardUserDefaults] objectForKey:flag] : @"";
}

+ (BOOL)isFlagLive:(NSString *)flag{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:flag]) {
        return YES;
    }else{
        return NO;
    }
}
@end
