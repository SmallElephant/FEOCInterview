//
//  DetailViewController.m
//  6-CountDown
//
//  Created by keso on 2017/7/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () {
    NSInteger topCount;
    NSInteger midCount;
}

@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet UILabel *midLabel;

@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;


@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) CADisplayLink *displayLink;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    topCount = 60;
    midCount = 0;
    [self setupTimer];
    [self setupDisplayLink];
    [self setupGCD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
}

- (void)dealloc {
    NSLog(@"Dealloc---%@",NSStringFromClass([self class]));
}

- (void)setupTimer {
    self.topLabel.text = [NSString stringWithFormat:@"%ld",topCount];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTopLabel) userInfo:nil repeats:YES];
}

- (void)updateTopLabel {
    topCount -= 1;
    self.topLabel.text = [NSString stringWithFormat:@"%ld",topCount];
    if (topCount == 0) {
        [self.timer invalidate];
    }
}

- (void)setupDisplayLink {
    self.midLabel.text = @"60";
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateMidLabel)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)updateMidLabel {
    midCount += 1;
    
    if (midCount % 60 == 0) {
        NSInteger result = 60 - midCount / 60;
        self.midLabel.text = [NSString stringWithFormat:@"%ld",result];
        if (result == 0) {
            [self.displayLink invalidate];
        }

    }
}

- (void)setupGCD {

    self.bottomLabel.text = @"60";
    __block NSInteger bottomCount = 61;
    
    //获取全局队列
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建一个定时器，并将定时器的任务交给全局队列执行
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    
    // 设置触发的间隔时间 1.0秒执行一次 0秒误差
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);

    __weak typeof(self)weakSelf = self;

    dispatch_source_set_event_handler(timer, ^{
        if (bottomCount <= 0) {
            //关闭定时器
            dispatch_source_cancel(timer);
        }else {
            bottomCount -= 1;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.bottomLabel.text = [NSString stringWithFormat:@"%ld",bottomCount];
            });
        }
    });
    
    dispatch_resume(timer);
}



@end
