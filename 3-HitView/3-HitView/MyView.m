//
//  MyView.m
//  3-HitView
//
//  Created by FlyElephant on 2017/6/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}

@end
