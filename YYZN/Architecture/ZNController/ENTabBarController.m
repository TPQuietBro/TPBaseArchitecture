//
//  ENTabBarController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENTabBarController.h"
#import "YYZNTabBarView.h"
#import "ENCreateChildVc.h"
#import "ENNavigationController.h"
#import "ENBMSHomeViewController.h"
#import "ENCSSHomeViewController.h"
#import "ENSettingHomeViewController.h"


@interface ENTabBarController ()<YYZNTabBarDelegate>

@end

@implementation ENTabBarController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBar];
    [self addChildVc];

}

#pragma mark - init custom tabbar

- (void)setTabBar{
    [self.view addSubview:self.tabBarView];
    [self setTabbarConstraints];
    [self.tabBar removeFromSuperview];
}

- (void)setTabbarConstraints{
    [self.tabBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        //equalTo需要用NSNumber类型
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
        //mas_equalTo直接用NSInteger类型
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW, tarBarHeight));
    }];
}

#pragma mark - YYZNTabBarDelegate method

- (void)didClickIndexButton:(YYZNTabBarView *)tabBarView AndIndex:(NSInteger)index{
    self.selectedIndex = index;
}
/*
 * modal 出中间圆形按钮弹出的控制器
 */
- (void)didClickCircleButton:(YYZNTabBarView *)tabBarView circleButton:(UIButton *)circleButton{
    [EWHudTool showHudTip:@"modal 出的控制器"];
}

#pragma mark - private method

- (void)addChildVc{
    ENCreateChildVc *oper = [[ENCreateChildVc alloc] init];
    //[oper createChildVcWithTabVc:self];
    //oper的作用是返回子控制器的数组,怎么操作子控制器交给当前控制器去决定
    for (ENNavigationController *nav in [oper createChildVc]) {
        //添加子控制器
        [self addChildViewController:nav];
    }
}


#pragma mark - getter

- (YYZNTabBarView *)tabBarView{
    if (!_tabBarView) {
        _tabBarView = [[YYZNTabBarView alloc] initWithTarBarTitle:@[@"IM",@"TASK",@"SETTING"] andTabBarStyle:ENTabBarStyleNormal];
        
//        _tabBarView = [[YYZNTabBarView alloc] initWithTarBarTitle:@[@"BMS",@"CSS",@"设置",@"12"] andCricleImage:[UIImage imageNamed:@"warn_icon"] andTabBarStyle:ENTabBarStyleCircle];
        _tabBarView.delegate = self;
    }
    return _tabBarView;
}

@end
