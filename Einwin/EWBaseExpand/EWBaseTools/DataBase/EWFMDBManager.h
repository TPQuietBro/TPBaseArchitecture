//
//  TPFMDBManager.h
//
//  Created by 唐鹏 on 16/1/15.
//  Copyright © 2016年 tangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface EWFMDBManager : NSObject

/**单例*/
+ (instancetype)shareManager;
/**打开数据库*/
- (void)openDataBase:(NSString *)path;
/**执行语句*/
- (BOOL)executeSql:(NSString *)sqlString;
/**查找并返回数据*/
- (FMResultSet *)queryData:(NSString *)sqlString;

- (void)closeDataBase;

@end
