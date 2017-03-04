//
//  MyJSExport.h
//  YYZN
//
//  Created by ccpg_it on 17/2/14.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  这个类专门存放协议方法

#import <Foundation/Foundation.h>

/*
 * 利用这个协议可以将native的方法同js中的方法对应起来,需要注意的是js端的方法必须带参数,没有参数的也必须加上(''),例如test('').好处是无须js端针对ios和安卓做出适配
 */
@protocol ENJSExports <JSExport>
/**native回退*/
- (void)goBackEning;
/**native支付*/
- (void)goEningPay:(id)json;
/**native登陆*/
- (void)goEningLogin;
/**进入native二维码*/
- (void)scanBarcode;
/**native url跳转*/
- (void)gotoNativeView:(id)url;
@end
