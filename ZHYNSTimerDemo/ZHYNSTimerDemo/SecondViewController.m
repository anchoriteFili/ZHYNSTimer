//
//  SecondViewController.m
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "SecondViewController.h"
#import "NSTimer+BlockTimer.h"
#import "ZHWeakObject.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 使用block时使用弱引用
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer zh_scheduledTimerWithTimeInterval:1 block:^{
//        [weakSelf timerRunning];
//    } repeats:YES];
    
    
    ZHWeakObject *weakObj = [ZHWeakObject proxyWithWeakObject:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakObj selector:@selector(timerRunning) userInfo:nil repeats:YES];
    
}


- (IBAction)pageJump:(UIButton *)sender {
    
    [self.navigationController pushViewController:[[ThirdViewController alloc] init] animated:YES];
}


// 计时器正在运行
- (void)timerRunning {
    
    NSLog(@"timer运行中");
}

- (void)dealloc {
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
