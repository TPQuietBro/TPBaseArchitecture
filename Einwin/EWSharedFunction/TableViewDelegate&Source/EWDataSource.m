//
//  ENDataSource.m
//  封装dataSource
//
//  Created by 唐鹏 on 16/3/12.
//  Copyright © 2016年 tangpeng. All rights reserved.
//

#import "EWDataSource.h"

@interface EWDataSource()

/***/
@property (nonatomic,strong) void(^callBackBlock)(id item,id cell);
/***/
@property (nonatomic,strong) NSArray *values;
/***/
@property (nonatomic,copy) NSString *identifier;

@property (nonatomic,strong) NSString *customCell;
@end

@implementation EWDataSource

+ (instancetype)dataSourceWithIdentifier:(NSString *)identifier values:(NSArray *)values callBackBlock:(void (^)(id, id))block customCell:(NSString *)customCell{
    return [[self alloc] initWithDataSourceWithIdentifier:identifier values:values callBackBlock:block customCell:customCell];
}

- (instancetype)initWithDataSourceWithIdentifier:(NSString *)identifier values:(NSArray *)values callBackBlock:(void (^)(id, id))block customCell:(NSString *)customCell{
    if (self = [super init]) {
        self.identifier = identifier;
        self.values = values;
        self.callBackBlock = [block copy];
        self.customCell = customCell;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.values.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    //这里区分自定义cell还是系统cell,通过反射机制创建自定义cell
    if (cell == nil) {
        if (self.customCell) {
            cell = [[NSClassFromString(self.customCell) alloc] init];
        }else{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.identifier];
        }
    }
    id item = self.values[indexPath.row];
    if (self.callBackBlock) {
        self.callBackBlock(item,cell);
    }
    return cell;
}

@end
