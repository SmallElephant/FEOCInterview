//
//  CircleButton.m
//  3-HitView
//
//  Created by FlyElephant on 2017/6/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGFloat halfWidth = self.bounds.size.width / 2;
    
    CGFloat xDistance = point.x - halfWidth;
    
    CGFloat yDistance = point.y - halfWidth;
    
    CGFloat radius = sqrt(xDistance * xDistance + yDistance * yDistance);
    
    NSLog(@"HaldWidth:%f---point:%@---x轴距离:%f---y轴距离:%f--半径:%f",halfWidth,NSStringFromCGPoint(point),xDistance,yDistance,radius);
    
    return radius <= halfWidth;
}

@end
