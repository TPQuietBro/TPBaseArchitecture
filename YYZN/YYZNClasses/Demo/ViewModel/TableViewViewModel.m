//
//  TableViewViewModel.m
//  YYZN
//
//  Created by ccpg_it on 17/2/21.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "TableViewViewModel.h"
#import "TestCellTableViewCell.h"
#import "TestAPIManger.h"
#import "TestDataFilter.h"
#import "TestItem.h"

@interface TableViewViewModel()<EWAPICallBackProtocol>

@property (nonatomic,strong)EWDataSource *dataSource;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) TestAPIManger *testApi;

@property (nonatomic , strong) TestDataFilter *dataFilter;

@end

@implementation TableViewViewModel

static NSString *ID = @"testBCell";
//自定义cell的名称
NSString *const KENCustomCell1 = @"TestCellTableViewCell";

- (instancetype)initWithView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        
    }
    return self;
}

- (void)start{

    TestAPIManger *testApi = [[TestAPIManger alloc] init];
    testApi.delegate = self;
    self.testApi = testApi;
    [testApi loadData];
    //[testApi cancelAllRequest];
}


- (void)managerCallBackDidFailed:(EWAPIBaseManager *)manager{
    SLog(@"--%@",manager.response.error);
}

- (void)managerCallBackDidSuccess:(EWAPIBaseManager *)manager{
    SLog(@"--%@",manager.response.responseObject);
    NSArray *data = [self.testApi filterDataWithFilter:self.dataFilter];
    
    [self refreshDataInView:self.tableView withData:data];
    
}

- (void)refreshDataInView:(UITableView *)tableView withData:(id)data{
    //这里必须用一个强指针指向datasource,不然立马就被销毁了
    self.dataSource = [self dataSourceWithData:data];
    tableView.dataSource = self.dataSource;
    SLog(@"ccccc%@",tableView.dataSource);
    [tableView reloadData];
}

#pragma mark - getter
- (TestDataFilter *)dataFilter{
    if (!_dataFilter) {
        _dataFilter = [[TestDataFilter alloc] init];
    }
    return _dataFilter;
}


- (EWDataSource *)dataSourceWithData:(id)data{
    EWDataSource *dataS = [EWDataSource dataSourceWithIdentifier:ID values:data callBackBlock:^(TestItem* item, TestCellTableViewCell* cell)  {
        cell.labelTitle = item.name;
        cell.imagePath = item.image;
    } customCell:KENCustomCell1];
    return dataS;
}

@end
