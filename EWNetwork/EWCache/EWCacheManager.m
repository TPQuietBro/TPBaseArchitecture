//
//  ENCacheManager.m
//  YYZN
//
//  Created by ccpg_it on 17/2/21.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWCacheManager.h"
#import "GTMBase64.h"
#import "NSString+DictToJSON.h"
#import "NSDictionary+JSONToDict.h"

@implementation EWCacheManager

+ (instancetype)shareInstance{
    static EWCacheManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (BOOL)saveCacheData:(id)dataObject{
    
    [self clearCacheData];
    
    NSString *json = [NSString dictionaryToJson:dataObject];
    NSData *cacheData = [json dataUsingEncoding:NSUTF8StringEncoding];

    BOOL writeSuccess = cacheData ? [cacheData writeToFile:[self cacheBasePath] atomically:YES] : NO;
    
    if (!writeSuccess) {
        NSLog(@"---写入失败");
        return NO;
    }
    
    return writeSuccess;
}

- (id)loadCacheData{
    
    NSString *path = [self cacheBasePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *responseDict = nil;
    if ([fileManager fileExistsAtPath:path isDirectory:nil]) {
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        responseDict = [NSDictionary jsonToDictionary:json];
    }
    return responseDict;
}

- (id)responseObject{
    if (![self loadCacheData]) {
        return nil;
    }
    return [self loadCacheData];
    
}

- (void)clearCacheData{
   NSFileManager *fileManager = [NSFileManager defaultManager];
   BOOL isExist = [fileManager fileExistsAtPath:[self cacheBasePath]];
    if (isExist) {
        [fileManager removeItemAtPath:[self cacheBasePath] error:nil];
    }
}

- (void)setfileHeader:(NSString *)fileHeader{
    _fileHeader = fileHeader;
    
}

- (NSString *)cacheFileName{
    //通过Base64加密文件名
    NSData *fileNameData = [GTMBase64 encodeData:[_fileHeader dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *fileName = [[NSString alloc] initWithData:fileNameData encoding:NSUTF8StringEncoding];
    return fileName;
}

- (NSString *)cacheBasePath{
    NSString *rootPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    return [rootPath stringByAppendingPathComponent:[self cacheFileName]];

}

@end
