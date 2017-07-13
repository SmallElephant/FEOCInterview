//
//  Person.m
//  8-Equal
//
//  Created by keso on 2017/7/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "Person.h"

@implementation Person

- (BOOL)isEqualToPerson:(Person *)person {
    
    if (!person) {
        return NO;
    }
    
    BOOL isEqualName = (!self.name && !person.name) || [self.name isEqualToString:person.name];
    BOOL isEqualAge = self.age == person.age;
    BOOL isEqualLocation = (!self.location && !person.location) || [self.location isEqualToString:person.location];
    
    return isEqualName & isEqualAge & isEqualLocation;
}

- (id)copyWithZone:(NSZone *)zone {
    Person *model = [[[self class] allocWithZone:zone] init];
    model.name = self.name;
    model.age  = self.age;
    model.location = self.location;
    return model;
}


#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[Person class]]) {
        return NO;
    }
    
    return [self isEqualToPerson:(Person *)object];
}

//- (NSUInteger)hash {
//    NSUInteger hash = [super hash];
//    NSLog(@"Person调用hash方法 = %ld", hash);
//    return hash;
//}

- (NSUInteger)hash {
    return [self.name hash] ^ [self.location hash];
}


@end
