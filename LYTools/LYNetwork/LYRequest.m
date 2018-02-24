//
//  LYRequest.m
//  BaseProject
//
//  Created by Public on 2018/1/4.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYRequest.h"
#import "LYNetworkConfig.h"
#import "AFNetworking.h"

@implementation LYRequest

/**Get请求(默认baseUrl)*/
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    // 1.创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@%@",config.baseUrl,url];
    manager.requestSerializer.timeoutInterval = config.timeoutInterval;
    if (config.isSecurity) {
        [self customSecurityPolicy];
    }
    [manager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
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

/**Post请求(默认baseUrl)*/
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    // 1.创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@%@",config.baseUrl,url];
    manager.requestSerializer.timeoutInterval = config.timeoutInterval;
    if (config.isSecurity) {
        [self customSecurityPolicy];
    }
    [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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

/**Get请求无baseUrl*/
+ (void)getWithoutBaseUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    // 1.创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    manager.requestSerializer.timeoutInterval = config.timeoutInterval;
    if (config.isSecurity) {
        [self customSecurityPolicy];
    }
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
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

/**Post请求无baseUrl*/
+ (void)postWithoutBaseUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    // 1.创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    manager.requestSerializer.timeoutInterval = config.timeoutInterval;
    if (config.isSecurity) {
        [self customSecurityPolicy];
    }
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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

/**https证书配置*/
+ (AFSecurityPolicy *)customSecurityPolicy
{
    // 先导入证书，在这加证书，一般情况适用于单项认证
    // 证书的路径(需要自己配置)
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"" ofType:@""];
    
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    if (cerData == nil) {
        return nil;
    }
    NSSet *setData = [NSSet setWithObject:cerData];
    /*
     AFSSLPinningModeNone: 代表客户端无条件地信任服务器端返回的证书
     
     AFSSLPinningModePublicKey : 代表客户端会将服务器端返回的证书与本地保存的证书PublicKey的部分进行校验;如果正确，才继续进行。
     
     AFSSLPinningModeCertificate: 代表客户端会将服务器端返回的证书和本地保存的证书中的所有内容，包括PublicKey和证书部分，全部进行校验;如果正确，才继续进行。
     */
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    // allowInvalidCertificates 是否允许无效证书(也就是自建的证书)，默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    // validatesDomainName 是否需要验证域名，默认为YES;
    // 假如证书的域名与你请求的域名不一致，需要把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    // 设置为NO，主要用于这种情况：客户端请求的事子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com,那么mail.google.com是无法验证通过的；当然有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    // 如设置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    [securityPolicy setPinnedCertificates:setData];
    
    return securityPolicy;
}

@end
