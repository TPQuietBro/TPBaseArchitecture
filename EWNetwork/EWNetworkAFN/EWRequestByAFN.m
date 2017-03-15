//
//  ENRequestByAFN.m
//  YYZN
//
//  Created by ccpg_it on 17/2/23.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWRequestByAFN.h"
#import "EWCacheManager.h"
#import "EWNetworkConstFile.h"

@interface EWRequestByAFN()

@property (strong, nonatomic) AFHTTPSessionManager *mgr;

@end

@implementation EWRequestByAFN
- (NSURLSessionDataTask *)requestByGetWithParams:(NSDictionary *)params success:(void (^)(id))success fail:(void (^)(NSError *))failure{
    
    NSString *url = params[EWRequestURLKey] ? params[EWRequestURLKey] : @"";
    NSDictionary *param = params[EWRequestDictKey] ? params[EWRequestDictKey] : @{};
    NSInteger cacheTime = [params[EWRequestCacheTimeKey] integerValue] ? [params[EWRequestCacheTimeKey] integerValue] : 0;
    //是否需要加载缓存
    
    EWCacheManager *cacheManager = [EWCacheManager shareInstance];
    cacheManager.fileHeader = url;
    
    //如果cacheTime大于0,才需要使用缓存数据
    if (cacheTime > 0) {
        id responseData = [cacheManager responseObject];
        success ? success(responseData) : nil;
    }
    
    NSURLSessionDataTask *dataTask = nil;
    
    //1.发送Get请求
    dataTask = [self.mgr GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        //写入文件
        if (cacheTime > 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [cacheManager saveCacheData:responseObject];
            });
        }
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure ? failure(error) : nil;
        NSLog(@"请求失败-->%@",error);
    }];

    return dataTask;
}

- (NSURLSessionDataTask *)requestByPostWithParams:(NSDictionary *)params success:(void (^)(id))success fail:(void (^)(NSError *))failure{
    
    NSURLSessionDataTask *dataTask = nil;
    
    NSString *url = params[EWRequestURLKey] ? params[EWRequestURLKey] : @"";
    
    NSDictionary *param = params[EWRequestDictKey] ? params[EWRequestDictKey] : @{};
    
    NSInteger cacheTime = [params[EWRequestCacheTimeKey] integerValue] ? [params[EWRequestCacheTimeKey] integerValue] : 0;
    //是否需要加载缓存
    
    EWCacheManager *cacheManager = [EWCacheManager shareInstance];
    cacheManager.fileHeader = url;
    
    //如果cacheTime大于0,才需要使用缓存数据
    if (cacheTime > 0) {
        id responseData = [cacheManager responseObject];
        success ? success(responseData) : nil;
        
    }
    NSDictionary *headerDict = params[EWRequestHeaderDictKey];
    //设置post的请求头
    if (headerDict) {
        self.mgr.requestSerializer = [AFJSONRequestSerializer serializer];
        [headerDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.mgr.requestSerializer setValue: obj forHTTPHeaderField:key];
        }];
    }
    //2.发送Post请求
    dataTask = [self.mgr POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        //写入文件
        dispatch_async(dispatch_get_main_queue(), ^{
            [cacheManager saveCacheData:responseObject];
        });
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure ? failure(error) : nil;
        NSLog(@"请求失败-->%@",error);
    }];
    
    
    
    return dataTask;
}

- (NSURLSessionDataTask *)uploadImageByPostWithParams:(NSDictionary *)params success:(void (^)(id))success fail:(void (^)(NSError *))failure{
    NSURLSessionDataTask *dataTask = nil;
 
    NSString *url = params[EWRequestURLKey] ? params[EWRequestURLKey] : @"";
    
    UIImage *image = params[EWUploadImageKey];
    //转成data
    NSData *data = UIImagePNGRepresentation(image);
    //转成string
    NSString *dataString = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    if(data == nil) return nil;
    
    //设置请求头
    NSDictionary *headerDict = params[EWRequestHeaderDictKey];
    if (headerDict) {
        self.mgr.requestSerializer = [AFJSONRequestSerializer serializer];
        [headerDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.mgr.requestSerializer setValue: obj forHTTPHeaderField:key];
        }];
    }
    
    NSDictionary *dic = @{
                          @"file":dataString
                          };
    dataTask = [self.mgr POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //设置格式
        [formData appendPartWithFileData:data name:@"file" fileName:@"icon.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
        
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure ? failure(error) : nil;
        NSLog(@"请求失败-->%@",error);
    }];
    
    
    
    return dataTask;
    
}

#pragma mark - getter


- (AFHTTPSessionManager *)mgr{
    if (!_mgr) {
        _mgr = [AFHTTPSessionManager manager];
        // 添加text/html支持
        _mgr.responseSerializer = [AFJSONResponseSerializer serializer];
        _mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    }
    return _mgr;
}

@end
