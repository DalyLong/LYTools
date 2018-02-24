//
//  LYNaviRightButton.h
//  BaseProject2
//
//  Created by Public on 2018/1/10.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNaviRightButton : NSObject
/**导航栏右上角添加文字按钮*/
+ (UIButton *)addRightItemWithTitle:(NSString *)title target:(UIViewController*)target action:(SEL)action enabled:(BOOL)enabled;
/**导航栏右上角添加图片按钮*/
+ (UIButton *)addRightItemWithImage:(UIImage *)image target:(UIViewController*)target action:(SEL)action enabled:(BOOL)enabled;
@end
