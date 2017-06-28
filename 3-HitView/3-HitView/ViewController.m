//
//  ViewController.m
//  3-HitView
//
//  Created by FlyElephant on 2017/6/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "FEButton.h"
#import "CircleButton.h"
#import "UIButton+FlyElephant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    CGRect test1 = CGRectMake(100, 100, 100, 100);
    
    CGRect test2 = CGRectMake(100, 100, 100, 100);
    
    test1 = CGRectInset(test1, 20, 20);
    test2 = CGRectInset(test2, -20, -20);
    
    
    //NSLog(@"按钮点击位置:%@---%@",NSStringFromCGRect(test1),NSStringFromCGRect(test2));
}

- (void)setUp {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    FEButton *button = [[FEButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    button.backgroundColor = [UIColor greenColor];
    [bgView addSubview:button];
    
    UIView *bgView1 = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    bgView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView1];
    

    CircleButton *button1 = [[CircleButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button1.backgroundColor = [UIColor greenColor];
    button1.clipsToBounds = YES;
    button1.layer.cornerRadius = 50;
    [button1 addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
    [bgView1 addSubview:button1];
    
    
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    bgView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView2];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    button2.backgroundColor = [UIColor greenColor];
    button2.hitTestEdgeInsets = UIEdgeInsetsMake(-20, -20, -20, -20);
    [button2 addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView2 addSubview:button2];
}

- (void)buttonAction1:(UIButton *)sender {
    NSLog(@"FlyElephant---圆形扩大点击区域");
}

- (void)buttonAction2:(UIButton *)sender {
    NSLog(@"Runtime扩大点击");
}


@end
