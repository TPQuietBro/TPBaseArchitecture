//
//  ENCacheManager.h
//  YYZN
//
//  Created by ccpg_it on 17/2/21.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  这个类用于缓存操作

#import <Foundation/Foundation.h>

@interface EWCacheManager : NSObject

+ (instancetype)shareInstance;

/*
 * 保存
 */
- (BOOL)saveCacheData:(id)dataObject;

/*
 * 加载缓存
 */
- (id)loadCacheData;

/*
 * 清除缓存
 */
- (void)clearCacheData;

/*
 * 写入的文件名,这里以url作为文件名
 */
//- (NSString *)cacheFileName:(NSString *)url;

- (id)responseObject;


@property (nonatomic , strong)NSString *fileHeader;


@end
