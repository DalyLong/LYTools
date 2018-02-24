//
//  UIButton+FastClickButton.m
//  FastClickButton
//
//  Created by Public on 2017/12/15.
//  Copyright © 2017年 Public. All rights reserved.
//

#import "UIButton+FastClickButton.h"
#import <objc/runtime.h>

@implementation UIButton (FastClickButton)

#define defaultInterval 0.2  //默认时间间隔

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)cs_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCs_acceptEventTime:(NSTimeInterval)cs_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(cs_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 在load时执行hook
+ (void)load {
    Method before   = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after    = class_getInstanceMethod(self, @selector(cs_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)cs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.cs_acceptEventTime < defaultInterval) {
        self.cs_acceptEventTime = [NSDate date].timeIntervalSince1970;
        return;
    }else{
        self.cs_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    [self cs_sendAction:action to:target forEvent:event];
}

// 重写，为了防止在tabBarController下点击tabBarItem时报错
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}

@end
