//
//  HttpTool.m
//  Conghua
//
//  Created by fits on 16/5/10.
//  Copyright © 2016年 fits. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager+NetworkManager.h"

@implementation HttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedHttpSessionManager];
    
        
    // 3.发送请求
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"%@",error);
            failure(error);
        }
    }];
    
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    
    // 2.发送请求
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (CCFormData *form in formDataArray) {
            [formData appendPartWithFileData:form.data name:form.name fileName:form.filename mimeType:form.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    AFHTTPResponseSerializer *responseSerializer=[AFHTTPResponseSerializer serializer];
    AFHTTPRequestSerializer *resquertSerializer=[AFHTTPRequestSerializer serializer];
    [mgr setRequestSerializer:resquertSerializer];
    [mgr setResponseSerializer:responseSerializer];
    
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    [mgr.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    // 2.发送请求
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
