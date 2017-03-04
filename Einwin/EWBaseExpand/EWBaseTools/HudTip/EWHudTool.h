//
//  ENHudTool.h
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  显示提示语

#import <Foundation/Foundation.h>

@interface EWHudTool : NSObject
/**阻断进程的提示*/
+(void)showAlertViewWithMessage:(NSString *)message;
/**即时提醒*/
+ (void)showHudTip:(NSString *)tipString;
@end
