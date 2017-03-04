//
//  ENTest_BViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENTest_BViewController.h"
#import "TableViewViewModel.h"

@interface ENTest_BViewController ()<UITableViewDelegate>
@property (nonatomic , strong) UITableView *testTableView;

@property (nonatomic , strong) TableViewViewModel *testViewModel;

@end

@implementation ENTest_BViewController
static NSString *ID = @"testBCell";

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.testTableView];
    [self testApiMethod];
}

#pragma mark - api methods
- (void)testApiMethod{
    //第一种方式发起请求
//    TestAPI *api = [[TestAPI alloc] initWithUsername:@"allen" password:@"123"];
//    //[api stop];取消请求
//    [ENRequestTool get:api success:^(id responseObject) {
//        //SLog(@"%@",responseObject)
//        self.apiArray = (NSArray *)[TestItem mj_objectArrayWithKeyValuesArray:responseObject[@"videos"]];
//        SLog(@"--%@",self.apiArray);
//        [self.testTableView reloadData];
//    } failure:^(NSError *error) {
//        
//    } animation:YES];
    //通过viewmodel拿到数据交给
    
    //第二种方式
    //EN_WeakSelf
//    [[TestViewModel shareInstance] loadDataWithCallBack:^(id data) {
//        weakSelf.apiArray = data;
//        
//    } completion:^{
//        [weakSelf.testTableView reloadData];
//    }];
//    [[TestViewModel shareInstance] bindTestView:self.testTableView completion:^{
//        [self.testTableView reloadData];
//    }];
    
    //第三种方式
   // [[TableViewViewModel shareInstance] refreshDataInView:self.testTableView completion:nil];
    //第四种方式
    self.testViewModel = [[TableViewViewModel alloc] initWithView:self.testTableView];
    [self.testViewModel start];
  
    
    
    
}
#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 144 * HeightFor1920;
}


#pragma mark - getter

- (UITableView *)testTableView{
    if (!_testTableView) {
        _testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _testTableView.delegate = self;
        _testTableView.allowsSelection = NO;
    }
    //这里需要一个属性dataSource指向这个回调,不然会拿不到dataSource
    //_testTableView.dataSource = self.dataSource;
    return _testTableView;
}

//- (ENDataSource *)dataSource{
//    
//    _dataSource = [ENDataSource dataSourceWithIdentifier:ID values:self.apiArray callBackBlock:^(TestItem* item, TestCellTableViewCell* cell)  {
//        cell.item = item;
//    } customCell:@"TestCellTableViewCell"];
//    
//    return _dataSource;
//}
//
//- (NSArray *)apiArray{
//    if (!_apiArray) {
//        _apiArray = [[NSArray alloc] init];
//    }
//    return _apiArray;
//}
@end
