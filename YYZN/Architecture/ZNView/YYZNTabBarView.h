//
//  YYSHTabBarView.h
//  YYSHDemo
//
//  Created by ccpg_it on 16/11/25.
//  Copyright © 2016年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ENTabBarsStyle) {
    ENTabBarStyleNormal,//普通的样式
    ENTabBarStyleCircle//中间带有圆圈按钮的样式
};

@class YYZNTabBarView;
@protocol YYZNTabBarDelegate <NSObject>
//点击tabbar按钮
- (void)didClickIndexButton:(YYZNTabBarView *)tabBarView AndIndex:(NSInteger)index;
//点击圆圈按钮,modal出新控制器
- (void)didClickCircleButton:(YYZNTabBarView *)tabBarView circleButton:(UIButton *)circleButton;

@end

@interface YYZNTabBarView : UIView
/**代理*/
@property (nonatomic , weak) id<YYZNTabBarDelegate> delegate;
/**标题*/
@property (nonatomic , strong) NSArray *tabBarTitle;
/**tabBar类型*/
@property (nonatomic , assign) ENTabBarsStyle tabBarStyle;
/**圆形按钮图片*/
@property (nonatomic , strong) UIImage *cirleImage;

/**初始化方法--ENTabBarStyleNormal*/
- (instancetype)initWithTarBarTitle:(NSArray *)tabBarTitle andTabBarStyle:(ENTabBarsStyle)tabBarStyle;
/**初始化方法--ENTabBarStyleCircle*/
- (instancetype)initWithTarBarTitle:(NSArray *)tabBarTitle andCricleImage:(UIImage *)cirleImage andTabBarStyle:(ENTabBarsStyle)tabBarStyle;

@end
