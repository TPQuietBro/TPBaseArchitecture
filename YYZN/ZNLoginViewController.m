/**
 
 ***************************************************************************************
 * 创建者  ：信息技术中心
 * 创建时间: 2017/3/3
 * 创建目的：
 ***************************************************************************************
 * 更新者 ：
 * 更新时间:
 * 更新内容:
 ***************************************************************************************
 ****************  该文件为深圳一应社区商务集团有限公司版权所有，未经允许不可更改   ****************
 Created by CCPG_iOS on 2017/3/3
   Copyright © 2017年 ccpg_it. All rights reserved.
 ********************************** 信息技术中心 *****************************************
 
 **/

#import "ZNLoginViewController.h"
#import "CSSHomeView.h"
#import "ZNLoginViewModel.h"
#import "CTMediator+Login.h"
#import "ENTabBarController.h"
@interface ZNLoginViewController ()

@property (strong,nonatomic) ZNLoginViewModel *loginVM;
@property (strong,nonatomic) CSSHomeView *csshomeView ;
@end

@implementation ZNLoginViewController


#pragma mark - life cycle
/**
 * 只做加载视图操作
 */
- (void)viewDidLoad{
    [super viewDidLoad];
    self.csshomeView = [[CSSHomeView alloc]initWithFrame:CGRectMake(0, 0, EW_ScreenW, EW_ScreenH)];
    self.csshomeView.delegate = self;
    [self.view addSubview:self.csshomeView];
}

/**
 * 预先加载或者返回加载(处理数据)
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

/**
 * 离开当前视图的操作
 */

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    
}

/**
 * 只做视图布局操作
 */
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}
/**
 * 收回,销毁操作
 */
- (void)delloc{
    NSLog(@"xiaohuimei???");
}

#pragma mark - init methods

#pragma mark - event response
- (void)doLoginBy:(NSDictionary *)userInfoDic{
    SLog(@"%@",userInfoDic);
    
    [self createDataBase];
    
    [self saveData:userInfoDic];
    
    [self.loginVM start];
    
}

#pragma mark - custom delegate
- (void)pushViewControllerWithParam:(id)param{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;//将登陆控制器销毁
    vc = nil;
    ENTabBarController *yyznTarBarVc = [[ENTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = yyznTarBarVc;
   // [self.navigationController pushViewController:[[CTMediator sharedInstance] jumpTomainViewController:nil] animated:YES];
}
#pragma mark - private methods
/**
 * 保存登陆信息
 */
- (void)saveData:(NSDictionary *)dict{
    
    NSString *name = dict[@"name"];
    
    NSString *memberCode = dict[@"memberCode"];
    
    NSString *password = dict[@"password"];
    
    //建表
    [[EWFMDBManager shareManager] executeSql:EW_CREATETABLE(@"zn_loginUserInfo", @"name text, password text, memberCode text")];
    
    //存数据
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO zn_loginUserInfo (name, password, memberCode) VALUES ('%@','%@','%@')",name,password,memberCode];
    
    
    [[EWFMDBManager shareManager] executeSql:insertSQL];
    
    SLog(@"---%d",[[EWFMDBManager shareManager] executeSql:insertSQL]);
    
    [[EWFMDBManager shareManager] closeDataBase];
}
/**
 * 创建,打开数据库
 */

- (void)createDataBase{
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    
//    NSString *dataPath = [path stringByAppendingPathComponent:@"yyzn.db"];
    
    [[EWFMDBManager shareManager] openDataBase:dataPath(@"yyzn.db")];
}

#pragma mark - getter / setter

- (ZNLoginViewModel *)loginVM{
    if (!_loginVM) {
        _loginVM = [[ZNLoginViewModel alloc] initWithView:self.csshomeView];
        _loginVM.delegate = self;
        
    }
    return _loginVM;
}
@end
