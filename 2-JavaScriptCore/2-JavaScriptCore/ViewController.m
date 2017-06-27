//
//  ViewController.m
//  2-JavaScriptCore
//
//  Created by FlyElephant on 2017/6/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "JavaScriptViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goWebviewAction:(UIButton *)sender {
    
    WebViewController *controller = [[WebViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)goLocalAction:(UIButton *)sender {
    
    JavaScriptViewController *controller = [[JavaScriptViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
