//
//  ZHWeakObject.m
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "ZHWeakObject.h"

@interface ZHWeakObject()

@property (nonatomic,weak) id weakObject;

@end

@implementation ZHWeakObject

- (instancetype)initWithWeakObject:(id)obj {
    _weakObject = obj;
    return self;
}

+ (instancetype)proxyWithWeakObject:(id)obj {
    return [[ZHWeakObject alloc] initWithWeakObject:obj];
}

/**
 * 消息转发，让_weakObject响应事件
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _weakObject;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_weakObject respondsToSelector:aSelector];
}


@end
