//
//  ENNavigationController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  

#import "ENNavigationController.h"
#import "ENTabBarController.h"
#import "YYZNTabBarView.h"
#import "ENScanHelper.h"
#import "CTMediator+Scan.h"

@interface ENNavigationController ()
/**点击二维码手势*/
@property (nonatomic , strong) UITapGestureRecognizer *tap;

@end

@implementation ENNavigationController

#pragma mark - life cycle
/*
 * 这里统一设置导航栏属性
 */
+ (void)load{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    [bar setBackgroundImage:[UIImage imageNamed:@"top"] forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTopImage];
}

#pragma mark - init methods
/*
 * 设置顶部图片
 */
- (void)setTopImage{
    [self.view addSubview:self.topLogoImageView];
    [self.view addSubview:self.topScanImageView];
    [self setTopLogoFrame];
    [self setTopScanFrame];
}
/*
 * 设置顶部图片的frame
 */
- (void)setTopLogoFrame{
    [self.topLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW / 3, 44));
    }];
}
- (void)setTopScanFrame{
    [self.topScanImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
}

#pragma mark - override system method
/*
 * 重写系统方法,实现底部tabbar隐藏
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    ENTabBarController *tabVc = (ENTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (self.childViewControllers.count > 0) {
        tabVc.tabBarView.hidden = YES;
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - event response
/*
 * 点击扫码
 */
- (void)tapScanView{
    SLog(@"扫码")
    //所有扫码样式在ScanHelper中可见
    
    [self pushViewController:[[ENScanHelper shareInstance] ScanVCWithStyle:qqStyle qrCodeCallBackBlock:^(id result) {
        SLog(@"-----%@",result);
    }] animated:YES];
}

#pragma mark - getter 

- (UITapGestureRecognizer *)tap{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScanView)];
    }
    return _tap;
}

- (UIImageView *)topLogoImageView{
    if (!_topLogoImageView) {
        _topLogoImageView = [[UIImageView alloc] init];
        _topLogoImageView.image = [UIImage imageNamed:@"titleImg"];
    }
    return _topLogoImageView;
}

- (UIImageView *)topScanImageView{
    if (!_topScanImageView) {
        _topScanImageView = [[UIImageView alloc] init];
        _topScanImageView.image = [UIImage imageNamed:@"erweima"];
        _topScanImageView.userInteractionEnabled = YES;
        [_topScanImageView addGestureRecognizer:self.tap];
    }
    return _topScanImageView;
}

@end
