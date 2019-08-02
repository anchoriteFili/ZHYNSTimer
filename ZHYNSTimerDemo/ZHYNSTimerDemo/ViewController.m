//
//  ViewController.m
//  ZHYNSTimerDemo
//
//  Created by 赵宏亚 on 2019/8/2.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (IBAction)click:(UIButton *)sender {
    
    
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}



@end
