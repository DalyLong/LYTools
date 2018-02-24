//
//  LYNetworkConfig.m
//  BaseProject
//
//  Created by Public on 2018/1/4.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYNetworkConfig.h"

@implementation LYNetworkConfig

+(LYNetworkConfig *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) {
        _baseUrl = @"https://www.baidu.com";//初始化baseUrl的地址
        _downloadUrl = @"https://www.baidu.com";//初始化下载的地址
        _timeoutInterval = 30.0f;//初始化请求超时的时间
        _isSecurity = NO;//是否使用https证书验证
        
        ///初始化下载的默认文件夹位置(并生成文件夹)
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        _downloadPath = [NSString stringWithFormat:@"%@/LYDownloads",docDir];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:_downloadPath]) {
            //如果没有downloads文件夹则创建文件夹
            [fileManager createDirectoryAtPath:_downloadPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return self;
}

@end
