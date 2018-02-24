//
//  LYDateConversion.h
//  BaseProject2
//
//  Created by Public on 2018/1/10.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYDateConversion : NSObject

/**时间戳转换format格式字符串*/
+(NSString *)conversionWithFormat:(NSString*)format andTime:(NSString *)time;

//根据时间戳获取星期几
+(NSString*)conversionWeekDayFordate:(NSString*)date;

/**
 *formatTime  将字符串按formatter转成nsdate
 *format  (@"YYYY-MM-dd hh:mm:ss") ----------
 *设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
 */
+(NSUInteger)conversionSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

/**获取当前时间戳*/
+(NSInteger)conversionNowTimestamp;

@end
