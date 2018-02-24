//
//  LYLoginStorage.h
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LYLocalStorageConfig.h"
@interface LYLoginStorage : NSObject <NSCopying>

+(LYLoginStorage*)sharedInstance;

//此类用于存储登录的一些信息
//个人信息等

/**用户名*/
@property(nonatomic,copy)NSString *userName;
/**密码*/
@property(nonatomic,copy)NSString *passWord;
/**头像*/
@property(nonatomic,copy)UIImage *headerImage;

/**保存到沙盒*/
-(void)save;

/**清除掉缓存*/
-(void)clear;

@end
