//
//  UILabel+Extension.h
//  BaseProject2
//
//  Created by Public on 2018/1/25.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**设置带行间距的label*/
-(void)setLabelSpaceWithValue:(NSString*)str andFont:(UIFont*)font;

/**获取有行间距的label的size*/
-(CGSize)getSpaceLabelHeightWithMaxSize:(CGSize)maxSize;

@end
