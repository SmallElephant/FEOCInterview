//
//  Person.m
//  7-Property
//
//  Created by keso on 2017/7/2.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "Person.h"


@implementation Person


@synthesize atomicName = _atomicName;

- (NSString *)atomicName {
    NSString *name;
    
    @synchronized (self) {
        name = _atomicName;
    }
    
    return name;
}

- (void)setAtomicName:(NSString *)atomicName {
    @synchronized(self) {      //类似于默认setter方法
        if (![_atomicName isEqualToString:atomicName]) {
            _atomicName = atomicName;
        }
    }
}

@end
