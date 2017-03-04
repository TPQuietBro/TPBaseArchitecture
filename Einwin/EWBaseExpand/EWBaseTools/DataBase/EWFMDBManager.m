//
//  TPFMDBManager.m
//
//  Created by 唐鹏 on 16/1/15.
//  Copyright © 2016年 tangpeng. All rights reserved.
//

#import "EWFMDBManager.h"

@interface EWFMDBManager()

/***/
@property (nonatomic,strong) FMDatabase *dataBase;

@end

@implementation EWFMDBManager

static EWFMDBManager *_shareInstance;
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[self alloc] init];
    });
    return _shareInstance;
}

- (void)openDataBase:(NSString *)path{
    self.dataBase = [FMDatabase databaseWithPath:path];
    [self.dataBase open];
    
    SLog(@"===%d",[self.dataBase open]);
}

- (BOOL)executeSql:(NSString *)sqlString{
    return [self.dataBase executeUpdate:sqlString];
}

- (FMResultSet *)queryData:(NSString *)sqlString{
    FMResultSet *result = [self.dataBase executeQuery:sqlString values:nil error:nil];
    if (![result next]) {
        return nil;
    }
    return result;
}

- (void)closeDataBase{
    [self.dataBase close];
}

@end
