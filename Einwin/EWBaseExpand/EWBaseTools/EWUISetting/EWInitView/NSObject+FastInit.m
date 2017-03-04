//
//  NSObject+FastInit.m
//  链式编程demo
//
//  Created by allentang on 2017/2/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "NSObject+FastInit.h"
#import <UIKit/UIKit.h>

#define weak __weak typeof(self) weakSelf = self;


@implementation NSObject (FastInit)

+ (blockInit)classInit{
    return ^NSObject *(UIObjectType objectType){
        
        switch (objectType) {
            case TypeView:
                return [[UIView alloc] init];
                break;
            case TypeLabel:
                return [[UILabel alloc] init];
                break;
            case TypeButton:
                return [[UIButton alloc] init];
                break;
            case TypeTextField:
                return [[UITextField alloc] init];
                break;
        }
        
    };
}

- (blockInit)instanceInit{
    return ^NSObject *(UIObjectType objectType){
        
        switch (objectType) {
            case TypeView:
                return [[UIView alloc] init];
                break;
            case TypeLabel:
                return [[UILabel alloc] init];
                break;
            case TypeButton:
                return [[UIButton alloc] init];
                break;
            case TypeTextField:
                return [[UITextField alloc] init];
                break;
        }
        
    };
}

@end
