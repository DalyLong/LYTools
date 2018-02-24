//
//  LYLocalStorageConfig.m
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYLocalStorageConfig.h"

@implementation LYLocalStorageConfig

+(LYLocalStorageConfig *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) {
        ///初始化本地化数据的文件夹(并生成文件夹)
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        _basePath = [NSString stringWithFormat:@"%@/LYLocalStorage",docDir];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:_basePath]) {
            //如果没有downloads文件夹则创建文件夹
            [fileManager createDirectoryAtPath:_basePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return self;
}

@end
