//
//  ViewController.m
//  5-PanGesture
//
//  Created by keso on 2017/7/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "PanView.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUp {
    
    UIView *tagView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    tagView.backgroundColor = [UIColor redColor];
    self.tagView = tagView;
    [self.view addSubview:self.tagView];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.tagView addGestureRecognizer:panGesture];
    
    TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    touchView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchView];
    
    PanView *panView = [[PanView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    panView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:panView];
    
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"视图拖动开始");
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [recognizer locationInView:self.view];
        
        if (location.y < 0 || location.y > self.view.bounds.size.height) {
            return;
        }
        CGPoint translation = [recognizer translationInView:self.view];
        
        NSLog(@"当前视图在View的位置:%@----平移位置:%@",NSStringFromCGPoint(location),NSStringFromCGPoint(translation));
        recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
        [recognizer setTranslation:CGPointZero inView:self.view];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"视图拖动结束");
    }
}

//- (void)handlePan:(UIPanGestureRecognizer *)gesture {
//    
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:
//            NSLog(@"滑动开始---UIGestureRecognizerStateBegan");
//            break;
//        case UIGestureRecognizerStateChanged:
//            NSLog(@"滑动改变---UIGestureRecognizerStateChanged");
//            break;
//        case UIGestureRecognizerStateEnded:
//            NSLog(@"滑动结束---UIGestureRecognizerStateEnded");
//            break;
//        case UIGestureRecognizerStateCancelled:
//            NSLog(@"滑动取消---UIGestureRecognizerStateCancelled");
//            break;
//        default:
//            break;
//    }
//}


@end
