//
//  Person.h
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TestBlock)();

@interface Person : NSObject

@property (strong, nonatomic) TestBlock strongBlock;


@property (copy, nonatomic)   TestBlock copyBlock;

@property (copy, atomic) NSString *atomicName;

@property (copy, nonatomic) NSString *name;

@end
