# ZHYNSTimer

> 循环引用的原因是timer与self相互持有造成的，根据原因可分析出解决思路，避免timer强引用self.
1. 避免timer持有self。

```objc
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
```

```objc
// 使用block时使用弱引用
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer zh_scheduledTimerWithTimeInterval:1 block:^{
        [weakSelf timerRunning];
    } repeats:YES];
```

2. 避免timer强引用self.

```objc
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
```

```objc
ZHWeakObject *weakObj = [ZHWeakObject proxyWithWeakObject:self];
self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakObj selector:@selector(timerRunning) userInfo:nil repeats:YES];
```

