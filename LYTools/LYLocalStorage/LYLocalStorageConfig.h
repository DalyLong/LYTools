//
//  LYLocalStorageConfig.h
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYLocalStorageConfig : NSObject

+(LYLocalStorageConfig*)sharedInstance;

/**
 *本地化存储文件默认目录(Documents/LocalStorage)
 *1.通过userdefault存储的数据无法存入该目录（userdefault可以方便修改一些）
 *2.通过归档和sqlite的数据都存入此处方便寻找
 */
@property (nonatomic, strong) NSString *basePath;

@end
