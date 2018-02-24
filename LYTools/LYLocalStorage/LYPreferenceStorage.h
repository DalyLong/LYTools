//
//  LYPreferenceStorage.h
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPreferenceStorage : NSObject

+(LYPreferenceStorage*)sharedInstance;

//每加一个就要手动初始化和重写set和get方法还有clear的清空操作（可以参照案例）
//(结果为字符串“YES”或者“NO”)(统一用字符串YES和NO代表是和否，方便存储)

/**是否是第一次启动*/
@property(nonatomic,strong)NSString *isFirstAction;
/**是否是第一次登录*/
@property(nonatomic,strong)NSString *isFirstLogin;

/**清除所有的缓存*/
-(void)clear;

@end
