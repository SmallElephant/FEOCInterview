//
//  DetialViewController.m
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "DetialViewController.h"
#import "User.h"

@interface DetialViewController ()

@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[User sharedInstance] clear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"Dealloc---%@",NSStringFromClass([self class]));
}


- (void)setUp {
    User *user = [User sharedInstance];
    user.userName = @"FlyElephant";
    
//    user.block = ^ {
////        NSLog(@"单例测试:%@",self);
//    };
    
    user.block = ^ {
        [User sharedInstance].userName = @"test";
    };
    
    [User userMethod:^{
        NSLog(@"类方法之间调用:%@",self);
    }];
    
    
}

@end
