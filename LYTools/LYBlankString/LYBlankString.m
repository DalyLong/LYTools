//
//  BlankString.m
//  
//
//  Created by 怡化电脑 on 15/9/24.
//  Copyright (c) 2015年 yihuaComputer. All rights reserved.
//

#import "LYBlankString.h"

@implementation LYBlankString
+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil ||string == NULL || [string isEqualToString:@"(null)"]) {
        return YES;
    }else if([string isKindOfClass:[NSNull class]]){
        return YES;
    }else if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPureInt:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end
