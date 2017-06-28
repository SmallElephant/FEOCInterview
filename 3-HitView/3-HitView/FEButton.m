//
//  FEButton.m
//  3-HitView
//
//  Created by FlyElephant on 2017/6/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "FEButton.h"

@implementation FEButton


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    NSLog(@"FlyElephant---被点击了:%@----点击的点:%@",NSStringFromCGRect(bounds), NSStringFromCGPoint(point));
    return CGRectContainsPoint(bounds, point);
}

@end
