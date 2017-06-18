//
//  ViewController.m
//  FEOCInterview
//
//  Created by keso on 2017/6/17.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUp1 {
    NSString *str1 = [NSString stringWithFormat:@"FlyElephant"];
    NSString *str2 = [NSString stringWithFormat:@"FlyElephant"];
    NSString *str3 = @"FlyElephant";
    
    NSLog(@"str1:-%p--str2:%p---str3:%p",str1,str2,str3);
    NSLog(@"== %d",str1 == str2);
    NSLog(@"isEqual--%d",[str1 isEqual:str2]);
    NSLog(@"%@--isEqualToString:%d",str1,[str1 isEqualToString:str2]);
    NSLog(@"%@--isEqualToString--%d",str1,[str1 isEqualToString:str3]);

}


@end
