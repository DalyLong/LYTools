//
//  LYDownload.h
//  BaseProject
//
//  Created by Public on 2018/1/5.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYNetworkConfig.h"
#import "AFNetworking.h"

@interface LYDownload : NSObject

/**
 *常规下载(基于downloadUrl)
 *filename(1.如果传nil的话会在url里面去找最后的文件名2.如果不传nil用于下载的为映射的地址，传过来的只有流，url中没有文件的具体信息，需要自己手动输入)
 */
+(NSURLSessionDownloadTask*)download:(NSString*)url fileName:(NSString*)fileName progress:(void (^)(NSProgress *downloadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *非downloadUrl下载
 *filename(1.如果传nil的话会在url里面去找最后的文件名2.如果不传nil用于下载的为映射的地址，传过来的只有流，url中没有文件的具体信息，需要自己手动输入)
 */
+(NSURLSessionDownloadTask*)downloadWithoutDownloadUrl:(NSString*)url fileName:(NSString*)fileName progress:(void (^)(NSProgress *downloadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *常规上传图片(基于downloadUrl)
 *name (这个参数很重要，和后台对应好，才能传过去)
 */
+(void)upload:(NSString*)url image:(UIImage*)image name:(NSString*)name  progress:(void (^)(NSProgress *uploadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *非downloadUrl上传图片
 *name (这个参数很重要，和后台对应好，才能传过去)
 */
+(void)uploadWithoutDownloadUrl:(NSString*)url image:(UIImage*)image name:(NSString*)name  progress:(void (^)(NSProgress *uploadProgress))progress success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
