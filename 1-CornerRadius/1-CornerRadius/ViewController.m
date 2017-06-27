//
//  ViewController.m
//  1-CornerRadius
//
//  Created by FlyElephant on 2017/6/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImgView;


@property (weak, nonatomic) IBOutlet UIImageView *midImgView;


@property (weak, nonatomic) IBOutlet UIImageView *bottomImgView;

@property (strong, nonatomic) NSString *_booName;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 最好的方式是YYWebImage.
    [self setUp];
    [self setUp1];
    [self setUp2];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"documentsDirectory%@",documentsDirectory);
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView sizeThatFits:CGSizeZero];
    webView.transform = CGAffineTransformMakeRotation(M_PI/-2);
    
   NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 100)];
   NSLog(@"测试数据:%@",indexSet);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)set_booName:(NSString *)_booName {
    
}




- (void)setUp { // 圆角比较差的原因有离屏渲染
    
    UIView *mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    mask.layer.cornerRadius = 50;
    mask.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mask];
    
    self.topImgView.maskView = mask; // 与设置layer.mask 是一样的
    
}

- (void)setUp1 {

    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(self.midImgView.bounds.size, NO, [UIScreen mainScreen].scale);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:self.midImgView.bounds cornerRadius:self.midImgView.frame.size.width] addClip];
    [self.midImgView drawRect:self.midImgView.bounds];
    
    self.midImgView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
}

- (void)setUp2 {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bottomImgView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.bottomImgView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bottomImgView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.bottomImgView.layer.mask = maskLayer;
}


@end
