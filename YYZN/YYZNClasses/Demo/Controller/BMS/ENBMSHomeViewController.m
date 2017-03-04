//
//  ENBMSHomeViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENBMSHomeViewController.h"
#import "ENTableViewDelegate+HomeTableViewDelegate.h"

@interface ENBMSHomeViewController ()

@property (nonatomic , strong) UITableView *testTableView;
//自定义dataSource
@property (nonatomic , strong) EWDataSource *dataSource;
//自定义tableViewDelegate
@property (nonatomic , strong) EWTableViewDelegate *delegate;
@end

@implementation ENBMSHomeViewController

#pragma mark - life cycle
static NSString *ID = @"testCell";
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [ENShowTabBar showTarBar];
    [ENHomeNavigationBarTool showTopImageInVc:self];
    [self setNavigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor purpleColor];
    //[self setPublicView];
    [self.view addSubview:self.testTableView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [ENHomeNavigationBarTool hideTopImageInVc:self];
}
#pragma mark - init method

- (void)setNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top"] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - custom delegate

#pragma mark - API delegate

#pragma mark - API method


#pragma mark - event response

#pragma mark - getter

- (UITableView *)testTableView{
    if (!_testTableView) {
        _testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        //初始化delegate
        self.delegate = [EWTableViewDelegate delegateInViewController:self WithCallbackBlock:nil];
        _testTableView.delegate = self.delegate;
        
        //这里需要一个属性dataSource指向这个回调,不然会拿不到dataSource
        self.dataSource = [EWDataSource dataSourceWithIdentifier:ID values:@[@"CTMediator页面跳转",@"H5界面",@"外部url跳转",@"请求数据"] callBackBlock:^(id item, UITableViewCell* cell) {
            cell.textLabel.text = item;
        }customCell:nil];
        
        _testTableView.dataSource = self.dataSource;
    }
    return _testTableView;
}

@end
