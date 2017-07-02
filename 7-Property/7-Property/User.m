//
//  User.m
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "User.h"

static User *sharedUser = nil;

static dispatch_once_t onceToken;

@implementation User

+ (instancetype)sharedInstance {
    
    dispatch_once(&onceToken, ^{
        sharedUser = [[User alloc] init];
    });
    
    return sharedUser;
}

+ (void)userMethod:(UserBlock)block {
    block();
}

- (void)clear {
    onceToken = 0;
    sharedUser = nil;
}

- (void)dealloc {
    NSLog(@"Dealloc---%@",NSStringFromClass([self class]));
}

@end
