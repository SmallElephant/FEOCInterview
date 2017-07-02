//
//  User.h
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UserBlock)(void);

@interface User : NSObject

@property (copy, nonatomic) NSString *userName;

@property (copy, nonatomic) UserBlock block;

+ (instancetype)sharedInstance;

+ (void)userMethod:(UserBlock)block;

- (void)clear;

@end
