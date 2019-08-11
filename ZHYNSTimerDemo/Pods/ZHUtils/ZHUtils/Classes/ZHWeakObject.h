//
//  ZHWeakObject.h
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHWeakObject : NSObject

+ (instancetype)proxyWithWeakObject:(id)obj;

@end

NS_ASSUME_NONNULL_END
