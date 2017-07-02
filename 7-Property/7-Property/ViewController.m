//
//  ViewController.m
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (strong, readonly,nonatomic) Person *person;

@property (copy, readonly,nonatomic) NSString *name;

@property (assign, getter=isSuccess,setter=setIsSuccess:,nonatomic) BOOL success;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isSuccess {
    return true;
}

- (void)setIsSuccess:(BOOL)status {
    NSLog(@"设置");
}


- (IBAction)testAction:(UIButton *)sender {
    self.person.strongBlock();
    self.person.copyBlock();
    
    NSLog(@"StrongBlock类型：%@", [self.person.strongBlock class]);
    
    
    NSLog(@"CopyBlock类型：%@", [self.person.copyBlock class]);
}

- (void)setUp {
    
    Person *person = [[Person alloc] init];
    
    __block NSString *name = @"FlyElephant";
    person.strongBlock = ^ {
        name = @"test";
        NSLog(@"%@---strong测试",name);
    };
    
    NSLog(@"StrongBlock类型：%@", [person.strongBlock class]);
    
//    person.retainBlock = ^ {
//        name = @"test";
//        NSLog(@"%@---retain测试",name);
//    };
//    
//    NSLog(@"RetainBlock类型：%@", [person.retainBlock class]);
    
    person.copyBlock = ^ {
        name = @"test";
        NSLog(@"%@---copy测试",name);
    };
    
    NSLog(@"CopyBlock类型：%@", [person.copyBlock class]);
    
//    self.person = person;
}


@end
