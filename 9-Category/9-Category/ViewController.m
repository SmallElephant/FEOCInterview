//
//  ViewController.m
//  9-Category
//
//  Created by keso on 2017/7/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "FEView.h"
#import "FEView+Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    FEView *view = [[FEView alloc] init];
    [view method2];
    
    view.name = @"xxx";
    
    view.content = @"FlyElephant";
    NSLog(@"content的内容:%@",view.content);
}


@end
