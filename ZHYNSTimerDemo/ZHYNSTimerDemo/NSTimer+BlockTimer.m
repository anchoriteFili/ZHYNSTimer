//
//  NSTimer+BlockTimer.m
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "NSTimer+BlockTimer.h"

@implementation NSTimer (BlockTimer)


+ (NSTimer *)zh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats {
    
    /**
    通过block方式，获取action，时间target设置为NSTimer类，这样我们使用timer时就不会再有循环引用了。
     */
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(zh_blockSelector:) userInfo:[block copy] repeats:repeats];
}

+ (void)zh_blockSelector:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
