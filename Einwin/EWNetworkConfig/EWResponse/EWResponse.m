//
//  EWResponse.m
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWResponse.h"

@implementation EWResponse

- (instancetype)initWithResopnseObject:(id)responseObject andError:(NSError *)error{
    if (self = [super init]) {
        self.responseObject = responseObject;
        self.error = error;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data andError:(NSError *)error{
    if (self = [super init]) {
        self.responseData = data;
        self.error = error;
    }
    return self;
}

@end
