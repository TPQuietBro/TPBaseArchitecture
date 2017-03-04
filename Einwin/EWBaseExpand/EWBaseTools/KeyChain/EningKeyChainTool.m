//
//  EningKeyChainTool.m
//  钥匙串保存
//
//  Created by ccpg_it on 16/12/8.
//  Copyright © 2016年 tangpeng. All rights reserved.
//

#import "EningKeyChainTool.h"
#import "EngingKeyChain.h"

@implementation EningKeyChainTool

static NSString * const KEY_IN_KEYCHAINPASSWORD = @"com.user.app.userInfo.password";
static NSString * const KEY_IN_KEYCHAINPHONE = @"com.user.app.userInfo.phone";

static NSString * const KEY_PASSWORD = @"com.user.app.password";
static NSString * const KEY_TELEPHONE = @"com.user.app.phone";

+ (void)savePhone:(NSString *)phone{
    NSMutableDictionary *usernameKVPairs = [NSMutableDictionary dictionary];
    [usernameKVPairs setObject:phone forKey:KEY_TELEPHONE];
    [EngingKeyChain save:KEY_IN_KEYCHAINPHONE data:usernameKVPairs];
}

+ (void)savePassWord:(NSString *)password
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [EngingKeyChain save:KEY_IN_KEYCHAINPASSWORD data:usernamepasswordKVPairs];
}

+ (instancetype)readPassWord
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[EngingKeyChain load:KEY_IN_KEYCHAINPASSWORD];
    return [usernamepasswordKVPair objectForKey:KEY_PASSWORD];
}

+ (instancetype)readPhone
{
    NSMutableDictionary *usernameKVPair = (NSMutableDictionary *)[EngingKeyChain load:KEY_IN_KEYCHAINPHONE];
    return [usernameKVPair objectForKey:KEY_TELEPHONE];
}

+ (void)deletePassWord
{
    [EngingKeyChain delete:KEY_IN_KEYCHAINPASSWORD];
}

+ (void)deletePhone
{
    [EngingKeyChain delete:KEY_IN_KEYCHAINPHONE];
}

@end
