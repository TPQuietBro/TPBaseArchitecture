//
//  ENHudTool.m
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWHudTool.h"

@implementation EWHudTool
+(void)showAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:message
                                                      delegate:nil
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
    [alertView show];
}

//提示页
+ (void)showHudTip:(NSString *)tipString{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = tipString;
    hud.label.textColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.color = [UIColor blackColor];
    [hud hideAnimated:YES afterDelay:1];
}
@end
