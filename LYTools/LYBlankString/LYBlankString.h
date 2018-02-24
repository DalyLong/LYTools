//
//  BlankString.h
//  判断输入是否为nil或空格
//
//  Created by 怡化电脑 on 15/9/24.
//  Copyright (c) 2015年 yihuaComputer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBlankString : NSObject
/**判断用户是否输入空格或输入内容为空*/
+(BOOL)isBlankString:(NSString *)string;
/**判断用户是否输入数字*/
+(BOOL)isPureInt:(NSString *)string;
@end
