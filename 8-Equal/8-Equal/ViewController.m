//
//  ViewController.m
//  8-Equal
//
//  Created by keso on 2017/7/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
    [self setup1];
    [self setup2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    
    NSString *str1 = @"FlyElephant";
    NSString *str2 = @"FlyElephant";
    
    NSLog(@"%p---%p",str1,str2);
    if (str1 == str2) {
        NSLog(@"字符串相等");
    }
}

- (void)setup1 {
    
    Person *person1 = [[Person alloc] init];
    person1.name = @"FlyElephant";
    person1.age = 27;
    person1.location = @"北京";
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"FlyElephant";
    person2.age = 27;
    person2.location = @"北京";
    
    BOOL isEqulPerson = [person1 isEqualToPerson:person2];
    
    if (isEqulPerson) {
        NSLog(@"person1与person2相等");
    } else {
        NSLog(@"两者不相等");
    }
    
    BOOL isEqual = [person1 isEqualToPerson:person2];
    if (isEqual) {
        NSLog(@"isEqual:person1与person2相等");
    } else {
        NSLog(@"isEqual:两者不相等");
    }
    
    
    
}

- (void)setup2 {
    
    Person *person1 = [[Person alloc] init];
    person1.name = @"FlyElephant";
    person1.age = 27;
    person1.location = @"北京";
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"FlyElephant1";
    person2.age = 28;
    person2.location = @"北京";
    
    NSMutableArray *arr1 = [[NSMutableArray alloc] initWithObjects:person1, nil];
    NSMutableArray *arr2 = [[NSMutableArray alloc] initWithObjects:person2, nil];
    
    NSLog(@"数组比较结束----------------------");
    NSMutableSet *set1 = [NSMutableSet set];
    [set1 addObject:person1];
    NSMutableSet *set2 = [NSMutableSet set];
    [set2 addObject:person2];
    NSLog(@"NSMutableSet添加结束 -------------------------------");
    
    NSMutableDictionary *dictionaryValue1 = [NSMutableDictionary dictionary];
    [dictionaryValue1 setObject:person1 forKey:@"dic1"];
    NSMutableDictionary *dictionaryValue2 = [NSMutableDictionary dictionary];
    [dictionaryValue2 setObject:person2 forKey:@"dic2"];
    NSLog(@"dictionary 将person设置为值-------------------------------");
    
    NSMutableDictionary *dictionaryKey1 = [NSMutableDictionary dictionary];
    [dictionaryKey1 setObject:@"1" forKey:person1];
    NSMutableDictionary *dictionaryKey2 = [NSMutableDictionary dictionary];
    [dictionaryKey2 setObject:@"2" forKey:person2];
    NSLog(@"dictionary 将person设置为键 -------------------------------");
    

    
}


@end
