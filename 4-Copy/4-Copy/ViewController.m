//
//  ViewController.m
//  4-Copy
//
//  Created by FlyElephant on 2017/6/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

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

- (void)setUp {
    [self copyTest];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    [button setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    [self.view addSubview:view];
}

- (void)test:(UIButton *)sender {
      NSLog(@"按钮点击了");
}


- (void)copyTest {
    NSString *string = @"FlyElephant";
    NSString *copyString = [string copy];
    NSMutableString *mutableCopyString = [string mutableCopy];
    [mutableCopyString appendString:@"test"];
    
    
    NSLog(@"NSString原始指针:%p copy之后的指针 = %p mutableCopy之后的指针 = %p", string, copyString, mutableCopyString);
    
    string = @"FlyElephant1";
    NSLog(@"测试结果:%@-----拷贝结果:%@",string,copyString);
    NSLog(@"NSString原始指针:%p copy之后的指针 = %p mutableCopy之后的指针 = %p", string, copyString, mutableCopyString);

}



@end
