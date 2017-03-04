//
//  ENNativePushTool.h
//  URL跳转
//
//  Created by ccpg_it on 16/10/12.
//  Copyright © 2016年 ccpg_it. All rights reserved.
//

#import "EWNativePushManager.h"
#import "DCURLRouter.h"

@implementation EWNativePushManager

static EWNativePushManager *singletion = nil;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletion = [[self alloc] init];
    });
    return singletion;
}

+ (void)PushEningViewController:(NSString *)url animated:(BOOL)Yes reverseBlock:(void (^)(id))reverse{
    [DCURLRouter pushURLString:url animated:YES reverseBlock:^(id _Nonnull reverseValue) {
        reverse(reverseValue);
    }];
}

+ (void)PushEningViewController:(NSString *)url Param:(NSDictionary *)param animated:(BOOL)yes{
    [DCURLRouter pushURLString:url query:param animated:yes];
}

+ (void)PushEningViewControllerWithTimes:(NSInteger)times animated:(BOOL)yes{
    [DCURLRouter popViewControllerWithTimes:times animated:yes];
}

@end
