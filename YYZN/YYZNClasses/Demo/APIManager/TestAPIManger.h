//
//  TestAPIManger.h
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWAPIBaseManager.h"

@interface TestAPIManger : EWAPIBaseManager<EWAPIManagerProtocol>
- (instancetype)initWithCustomRequest:(NSMutableURLRequest *)customRequest;
@end
