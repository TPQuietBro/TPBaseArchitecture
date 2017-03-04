//
//  EWAPICallBackProtocol.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EWAPIBaseManager;

@protocol EWAPICallBackProtocol <NSObject>
@required
//请求成功
- (void)managerCallBackDidSuccess:(EWAPIBaseManager *)manager;

//请求失败
- (void)managerCallBackDidFailed:(EWAPIBaseManager *)manager;
@end
