//
//  NSString+Extension.h
//  MVMS2
//
//  Created by Public on 17/8/30.
//  Copyright © 2017年 longyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 *通过字体和size得到宽或者高
 *
 *@param font 字体
 *
 *@param maxSize 最大size
 */
- (CGSize)stringSizeWithFont:(UIFont*)font maxSize:(CGSize)maxSize;

@end
