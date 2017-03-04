//
//  ENTableViewDelegate+HomeTableViewDelegate.m
//  YYZN
//
//  Created by ccpg_it on 17/2/14.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENTableViewDelegate+HomeTableViewDelegate.h"
#import "CTMediator+Test_A.h"
#import "CTMediator+MoudleB.h"

@implementation EWTableViewDelegate (HomeTableViewDelegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 144 * HeightFor1920;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    //CTMediator跳转
    if (index == 0) {
        
        UIViewController *Avc = [[CTMediator sharedInstance] getTest_AViewController:@{@"userName" : @"allen"}];
        [self.viewController.navigationController pushViewController:Avc animated:YES];
        //url方式跳转到H5
    }else if (index == 1){
        
        [EWNativePushManager PushEningViewController:@"http://123" animated:YES reverseBlock:nil];
        //外部链接跳转到本地
    }else if (index == 2){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [EWNativePushManager PushEningViewController:@"ening://blank?id=1&name=李四" animated:YES reverseBlock:^(id value){
            cell.textLabel.text = value;
        }];
        //
    }else if (index == 3){
        UIViewController *vc = [[CTMediator sharedInstance] getTest_BViewController:nil];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}

@end
