//
//  ZNRequestAnimation.m
//  YYZN
//
//  Created by ccpg_it on 17/3/3.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ZNRequestAnimation.h"

@implementation ZNRequestAnimation
+ (void)showHudAnimation{
    //创建UIImageView，添加到界面
    UIImageView *imageView = [[UIImageView alloc] init];
    
    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=0; i<12; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 12*0.05;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
    [imageView startAnimating];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, HeightFor1920*144, EW_ScreenW, EW_ScreenH - HeightFor1920*144)];
    view.userInteractionEnabled = YES;
    view.tag = 5000;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    // 显示到主窗口中
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 显示模式,改成customView,即显示自定义图片(mode设置,必须写在customView赋值之前)
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imageView;
}

+ (void)hideHudAtWindow{
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if (view.tag == 5000&&[view isKindOfClass:[UIView class]]) {
            [MBProgressHUD hideHUDForView:view animated:YES];
            [view removeFromSuperview];
        }
    }
}

@end
