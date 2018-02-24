//
//  LYNetworkConfig.h
//  BaseProject
//
//  Created by Public on 2018/1/4.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYNetworkConfig : NSObject

+(LYNetworkConfig*)sharedInstance;

/**基础域名地址(例https://www.baidu.com)(如果有大量用到的其它地址，按规格自行添加)*/
@property (nonatomic, strong) NSString *baseUrl;

/**上传或下载地址基础域名(例https://www.baidu.com)*/
@property (nonatomic, strong) NSString *downloadUrl;

/**下载文件基础目录(Documents/downloads)*/
@property (nonatomic, strong) NSString *downloadPath;

/**基础请求超时的时间*/
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**设置是否需要https证书认证*/
@property (nonatomic, assign) BOOL isSecurity;

@end
