//
//  ENScanHelper.h
//  YYZN
//
//  Created by zhengrui on 17/2/13.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENScanQRCodeViewController.h"
typedef NS_ENUM(NSInteger, QRScanStyle) {
    qqStyle,        //QQ风格
    ZhiFuBaoStyle,  //支付宝风格
    InnerStyle,     //无边框，内嵌4个角
    weixinStyle,    //微信风格
    OnStyle,        //4个角在矩形框线上,网格动画
    changeSize      //改变扫码区域位置
};

@interface ENScanHelper : NSObject

@property (nonatomic , assign) QRScanStyle qRScanStyle;


- (ENScanQRCodeViewController *)ScanVCWithStyle:(QRScanStyle )style qrCodeCallBackBlock:(void(^)(id result))block;

+ (instancetype)shareInstance;
@end
