//
//  YYZNMarcoFile.h
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  存放常用的宏

#import <Foundation/Foundation.h>

#define EW_ScreenW [UIScreen mainScreen].bounds.size.width
#define EW_ScreenH [UIScreen mainScreen].bounds.size.height
#define HeightFor1920  [UIScreen mainScreen].bounds.size.height/1920
#define WidthFor1080   [UIScreen mainScreen].bounds.size.width/1080

//网络状态的宏
#define EWNETWORKSTATUSUNKOWN @"UNKOWN"
#define EWNETWORKSTATUSWIFI @"WIFI"
#define EWNETWORKSTATUSNOTREACH @"NOTREACH"
#define EWNETWORKSTATUSWWAN @"WWAN"



#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] );
#else
#define SLog(format, ...);
#endif

//weakSelf
#define EW_WeakSelf __weak typeof(self) weakSelf = self;

//获取主window
#define ENKeyWindow [UIApplication sharedApplication].keyWindow

/*
 * 创建表格
 * tableName  : 表名
 * columsNames  : 所有列名
 */
#define EW_CREATETABLE(tableName,columsNames) [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id integer PRIMARY KEY AUTOINCREMENT, %@)",tableName,columsNames]


#define URLHostStringForTest(methodName) [NSString stringWithFormat:@"http://120.25.226.186:32812/%@",methodName]


@interface EWNetworkMarcoFile : NSObject

@end
