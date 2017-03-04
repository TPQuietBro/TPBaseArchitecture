//
//  ENNativeFunctionManager.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWNativeFunctionManager.h"
#import "CTMediator+Scan.h"
#import "ENScanHelper.h"

@interface EWNativeFunctionManager()

@end

@implementation EWNativeFunctionManager

- (instancetype)initWithViewController:(UIViewController *)viewController{
    if (self = [super init]) {
        self.viewController = viewController;
    }
    return self;
}

- (void)goBackEning{
    if (self.viewController) {
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
}

- (void)goEningPay:(id)json{
    //利用工具类转化json
    //NSDictionary *params = [JSONManager jsonToDictionary:json];
    //利用分类转化json
    //NSDictionary *params = [NSDictionary jsonToDictionary:json];
    //下面的操作就是将参数传递到支付界面即可
    [EWHudTool showAlertViewWithMessage:json];
}

- (void)goEningLogin{
    [EWHudTool showAlertViewWithMessage:@"please wait"];
}

- (void)scanBarcode{
    //UIViewController *scanVc = [[CTMediator sharedInstance] getScanViewController];
    //[self.viewController.navigationController pushViewController:scanVc animated:YES];
    
//    [ENScanHelper shareInstance].delegate = self;
//    [[ENScanHelper shareInstance] goScanWithStyle:@"qqStyle"];
    //[[ENScanHelper shareInstance] getScanVcWithStyle];
    //所有扫码样式在ScanHelper中可见
    
    [self.viewController.navigationController pushViewController:[[ENScanHelper shareInstance] ScanVCWithStyle:ZhiFuBaoStyle qrCodeCallBackBlock:nil] animated:YES];
}


- (void)gotoNativeView:(id)url{
    if ([url rangeOfString:@" "].length > 0) {
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [EWNativePushManager PushEningViewController:url animated:YES reverseBlock:nil];
    });
}



@end
