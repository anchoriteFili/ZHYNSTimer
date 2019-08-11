//
//  NSTimer+BlockTimer.h
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (BlockTimer)



+ (NSTimer *)zh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
