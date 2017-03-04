//
//  NSObject+FastInit.h
//  链式编程demo
//
//  Created by allentang on 2017/2/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, UIObjectType)
{
    TypeView = 0,
    TypeLabel = 1,
    TypeButton = 2,
    TypeTextField = 3
};

typedef NSObject *(^blockInit)(UIObjectType objectType);

@interface NSObject (FastInit)

+ (blockInit)classInit;

- (blockInit)instanceInit;

@end
