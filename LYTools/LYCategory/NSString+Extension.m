//
//  NSString+Extension.m
//  MVMS2
//
//  Created by Public on 17/8/30.
//  Copyright © 2017年 longyue. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *通过字体和size得到宽或者高
 *
 *@param font 字体
 *
 *@param maxSize 最大size
 */
- (CGSize)stringSizeWithFont:(UIFont*)font maxSize:(CGSize)maxSize{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: font};
    // 设定最大宽高
    CGSize size = maxSize;
    // 计算文字Frame
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return frame.size;
}

@end
