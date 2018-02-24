//
//  UILabel+Extension.m
//  BaseProject2
//
//  Created by Public on 2018/1/25.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

#define UILABEL_LINE_SPACE 5 //行间距

//给UILabel设置行间距和字间距
-(void)setLabelSpaceWithValue:(NSString*)str andFont:(UIFont*)font{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    self.attributedText = attributeStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGSize)getSpaceLabelHeightWithMaxSize:(CGSize)maxSize{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(maxSize.width, maxSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size;
}

@end
