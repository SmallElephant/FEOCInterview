//
//  FEView+Test.m
//  9-Category
//
//  Created by keso on 2017/7/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "FEView+Test.h"
#import <objc/runtime.h>

static const void *contentKey = &contentKey;

@implementation FEView (Test)

- (CGFloat)x {
    return CGRectGetMidX(self.frame);
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (NSString *)name {
    return @"FEView";
}

- (void)setName:(NSString *)name {
    NSLog(@"测试");
}

- (NSString *)content {
    return  objc_getAssociatedObject(self, @selector(content));
}

- (void)setContent:(NSString *)content {
    objc_setAssociatedObject(self, @selector(content), content, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


//- (void)method2 {
//    NSLog(@"Category---method2方法实现");
//}

@end
