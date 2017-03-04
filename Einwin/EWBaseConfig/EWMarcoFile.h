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

//文字适配
#define Font62              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"STHeitiSC-Light" size:18] : [UIFont fontWithName:@"STHeitiSC-Light" size:23];

#define Font54              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"STHeitiSC-Light" size:16] : [UIFont fontWithName:@"STHeitiSC-Light" size:21];
#define Font48              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"STHeitiSC-Light" size:14] : [UIFont fontWithName:@"STHeitiSC-Light" size:19];
#define Font42              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"STHeitiSC-Light" size:12] : [UIFont fontWithName:@"STHeitiSC-Light" size:17];
#define Font36              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"STHeitiSC-Light" size:10] : [UIFont fontWithName:@"STHeitiSC-Light" size:15];

#define Bold15 [UIFont boldSystemFontOfSize:15]
#define Bold17 [UIFont boldSystemFontOfSize:17]
#define Bold19 [UIFont boldSystemFontOfSize:19]
#define Bold25 [UIFont boldSystemFontOfSize:25]

#define isIOS7                [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO
#define ColorForBackground    [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1]
#define ColorForLine          [UIColor colorWithRed:232.0/255 green:232.0/255 blue:232.0/255 alpha:1]
#define ColorFor204           [UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1]
#define ColorFor176           [UIColor colorWithRed:176.0/255 green:176.0/255 blue:176.0/255 alpha:1]
#define ColorFor153           [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1]
#define ColorFor138           [UIColor colorWithRed:138.0/255 green:138.0/255 blue:138.0/255 alpha:1]
#define ColorForTitle         [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1]
#define ColorForRed           [UIColor colorWithRed:255.0/255 green:68.0/255 blue:0/255 alpha:1]
#define ColorForShadow        [UIColor colorWithRed:249.0/255 green:249.0/255 blue:249.0/255 alpha:1]
#define ColorForSection       [UIColor colorWithRed:243.0/255 green:243.0/255 blue:243.0/255 alpha:1]
#define ColorFor170           [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1]


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

#define URLHostStringForBusiness(methodName) [NSString stringWithFormat:@"%@/%@",EWHostStringForBusiness,methodName]

#define URLHostStringForProperty(methodName) [NSString stringWithFormat:@"%@/%@",EWHostStringForProperty,methodName]

#define URLHostStringForIntelligence(methodName) [NSString stringWithFormat:@"%@/%@",EWHostStringForIntelligence,methodName]

#define dataPath(fileName)  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:fileName]

#define URLHostStringForTest(methodName) [NSString stringWithFormat:@"http://120.25.226.186:32812/%@",methodName]


@interface EWMarcoFile : NSObject

@end
