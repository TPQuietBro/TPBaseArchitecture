//
//  EningKeyChainTool.h
//  钥匙串保存
//
//  Created by ccpg_it on 16/12/8.
//  Copyright © 2016年 tangpeng. All rights reserved.
//  用于keychain操作

#import <Foundation/Foundation.h>

@interface EningKeyChainTool : NSObject
/**
 *    @brief    存储手机号码
 *
 *    @param     phone     手机号码
 */
+(void)savePhone:(NSString *)phone;
/**
 *    @brief    存储密码
 *
 *    @param     password     密码内容
 */
+(void)savePassWord:(NSString *)password;

/**
 *    @brief    读取密码
 *
 *    @return    密码内容
 */
+(instancetype)readPassWord;

/**
 *    @brief    读取手机号码
 *
 *    @return    手机号码
 */
+(instancetype)readPhone;
/**
 *    @brief    删除密码数据
 */
+(void)deletePassWord;
/**
 *    @brief    删除手机号
 */
+ (void)deletePhone;
@end
