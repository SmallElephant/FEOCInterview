//
//  Person.h
//  8-Equal
//
//  Created by keso on 2017/7/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>

@property (copy, nonatomic) NSString *name;

@property (assign, nonatomic) NSUInteger age;

@property (copy, nonatomic) NSString *location;

- (BOOL)isEqualToPerson:(Person *)person;

@end
