//
//  LYDownload.m
//  BaseProject
//
//  Created by Public on 2018/1/5.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYDownload.h"

@implementation LYDownload

/**常规下载(基于baseUrl)*/
+(NSURLSessionDownloadTask*)download:(NSString*)url fileName:(NSString*)fileName progress:(void (^)(NSProgress *downloadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
     /*
     第一个参数:请求对象
     第二个参数:progress 进度回调
     第三个参数:destination--(downloadTask-)
     在该block中告诉AFN应该把文件存放在什么位置,AFN内部会自动的完成文件的剪切处理
     targetPath:文件的临时存储路径(tmp)
     response:响应头信息
     返回值:文件的最终存储路径
     第四个参数:completionHandler 完成之后的回调
     filePath:文件路径 == 返回值
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@%@",config.downloadUrl,url];
    NSString *downloadPath = nil;
    if (fileName == nil) {
        downloadPath= [NSString stringWithFormat:@"%@/%@",config.downloadPath,[url lastPathComponent]];
    }else{
        downloadPath= [NSString stringWithFormat:@"%@/%@",config.downloadPath,fileName];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:
                                          ^(NSProgress * _Nonnull downloadProgress) {
                                              
                                              //进度回调,可在此监听下载进度(已经下载的大小/文件总大小)
                                              progress(downloadProgress);
                                              
                                          } destination:^NSURL * _Nonnull(NSURL * _Nonnull
                                                                          targetPath, NSURLResponse * _Nonnull response) {
                                              //返回一个地址
                                              return [NSURL URLWithString:downloadPath];
                                              
                                          } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath,
                                                                NSError * _Nullable error) {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  if (!error) {
                                                      success(filePath);
                                                  }else{
                                                      //失败的情况下，如果下载的文件存在则删除掉
                                                      NSFileManager *fileManager = [NSFileManager defaultManager];
                                                      if (![fileManager fileExistsAtPath:downloadPath]) {
                                                          [fileManager removeItemAtPath:downloadPath error:nil];
                                                      }
                                                      
                                                      failure(error);
                                                  }
                                              });
                                              
                                          }];
    [download resume];
    
    return download;
}

/**非baseUrl下载*/
+(NSURLSessionDownloadTask*)downloadWithoutDownloadUrl:(NSString*)url fileName:(NSString*)fileName progress:(void (^)(NSProgress *downloadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    /*
     第一个参数:请求对象
     第二个参数:progress 进度回调
     第三个参数:destination--(downloadTask-)
     在该block中告诉AFN应该把文件存放在什么位置,AFN内部会自动的完成文件的剪切处理
     targetPath:文件的临时存储路径(tmp)
     response:响应头信息
     返回值:文件的最终存储路径
     第四个参数:completionHandler 完成之后的回调
     filePath:文件路径 == 返回值
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    NSString *downloadPath = nil;
    if (fileName == nil) {
        downloadPath= [NSString stringWithFormat:@"%@/%@",config.downloadPath,[url lastPathComponent]];
    }else{
        downloadPath= [NSString stringWithFormat:@"%@/%@",config.downloadPath,fileName];
    }
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:
                                          ^(NSProgress * _Nonnull downloadProgress) {
                                              
                                              //进度回调,可在此监听下载进度(已经下载的大小/文件总大小)
                                              progress(downloadProgress);
                                              
                                          } destination:^NSURL * _Nonnull(NSURL * _Nonnull
                                                                          targetPath, NSURLResponse * _Nonnull response) {
                                              //返回一个地址
                                              return [NSURL URLWithString:downloadPath];
                                              
                                          } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath,
                                                                NSError * _Nullable error) {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  if (!error) {
                                                      success(filePath);
                                                  }else{
                                                      //失败的情况下，如果下载的文件存在则删除掉
                                                      NSFileManager *fileManager = [NSFileManager defaultManager];
                                                      if (![fileManager fileExistsAtPath:downloadPath]) {
                                                          [fileManager removeItemAtPath:downloadPath error:nil];
                                                      }
                                                      
                                                      failure(error);
                                                  }
                                              });
                                              
                                          }];
    [download resume];
    
    return download;
}

/**常规上传图片(基于downloadUrl)*/
+(void)upload:(NSString*)url image:(UIImage*)image name:(NSString*)name  progress:(void (^)(NSProgress *uploadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *mrg = [AFHTTPSessionManager manager];
    LYNetworkConfig *config = [LYNetworkConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@%@",config.downloadUrl,url];
    [mrg POST:path parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = UIImageJPEGRepresentation(image,0.2);
        NSString *format = @"jpg";
        NSString *Suffix = @"jpeg";
        if (data == nil) {
            data = UIImagePNGRepresentation(image);
            format = @"png";
            Suffix = @"png";
        }
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyyMMdd_HHmmss"];
        NSString *attachmentName = [dateFormatter stringFromDate:[NSDate date]];
        [formData appendPartWithFileData:data name:name fileName:[NSString stringWithFormat:@"%@.%@",attachmentName,format] mimeType:[NSString stringWithFormat:@"image/%@",Suffix]];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //获取上传进度
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

/**
 *非downloadUrl上传图片
 *name (这个参数很重要，和后台对应好，才能传过去)
 */
+(void)uploadWithoutDownloadUrl:(NSString*)url image:(UIImage*)image name:(NSString*)name  progress:(void (^)(NSProgress *uploadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *mrg = [AFHTTPSessionManager manager];
    [mrg POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = UIImageJPEGRepresentation(image,0.2);
        NSString *format = @"jpg";
        NSString *Suffix = @"jpeg";
        if (data == nil) {
            data = UIImagePNGRepresentation(image);
            format = @"png";
            Suffix = @"png";
        }
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyyMMdd_HHmmss"];
        NSString *attachmentName = [dateFormatter stringFromDate:[NSDate date]];
        [formData appendPartWithFileData:data name:name fileName:[NSString stringWithFormat:@"%@.%@",attachmentName,format] mimeType:[NSString stringWithFormat:@"image/%@",Suffix]];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //获取上传进度
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
