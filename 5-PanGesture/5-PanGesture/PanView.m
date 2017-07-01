//
//  PanView.m
//  5-PanGesture
//
//  Created by keso on 2017/7/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "PanView.h"

@implementation PanView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:panGesture];
    }
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [recognizer locationInView:self.superview];
        
        if (location.y < 0 || location.y > self.superview.bounds.size.height) {
            return;
        }
        CGPoint translation = [recognizer translationInView:self.superview];
        
        NSLog(@"当前视图在View的位置:%@----平移位置:%@----原始重点位置:%@",NSStringFromCGPoint(location),NSStringFromCGPoint(translation),NSStringFromCGPoint(recognizer.view.center));
        recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
        
        
        [recognizer setTranslation:CGPointZero inView:self.superview];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {

    }
}



@end
