//
//  UIView+HUD.m
//  YHCollaboration
//
//  Created by Public on 17/3/13.
//  Copyright © 2017年 longyue. All rights reserved.
//

#import "UIView+HUD.h"
#import "MBProgressHUD.h"
@implementation UIView (HUD)

- (void)showHint:(NSString *)hint
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = hint;
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}

@end
