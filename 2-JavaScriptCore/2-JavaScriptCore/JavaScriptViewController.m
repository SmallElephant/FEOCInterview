//
//  JavaScriptViewController.m
//  2-JavaScriptCore
//
//  Created by FlyElephant on 2017/6/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "JavaScriptViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "User.h"
#import <objc/runtime.h>

@protocol UIButtonExportProtocol <JSExport>

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@end

@interface JavaScriptViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

@property (strong, nonatomic) UIButton *testButton;

@property (strong, nonatomic) JSContext *jsContext;

@end

@implementation JavaScriptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebviewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始---webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"加载结束---webViewDidFinishLoad");
    self.jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [self setUpJavaScriptCallBack];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载出错---didFailLoadWithError");
    
    self.navigationItem.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    JSValue *value = [self.jsContext evaluateScript:@"document.title"];
    self.navigationItem.title = value.toString;
    
    [self.jsContext setExceptionHandler:^(JSContext *context, JSValue *exception){
        NSLog(@"%@", exception);
    }];
}

#pragma mark - SetUp

- (void)setUp {
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JavaScript" ofType:@"html"];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:baseURL];
    [self.view addSubview:webView];
    self.webView = webView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Export 按钮" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 350, 300, 40);
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.testButton = button;
}

- (void)setUpJavaScriptCallBack {
    
    __weak typeof(self) weakSelf = self;
    self.jsContext[@"jsClick"] = ^ {
        NSArray *args = [JSContext currentArguments];
        NSMutableArray *messages = [NSMutableArray array];
        for (JSValue *obj in args) {
            [messages addObject:[obj toObject]];
        }
        [weakSelf.jsContext evaluateScript:@"alert('FlyElephant---OC实现')"];
    };
    
    self.jsContext[@"jsClick2"] = ^ {
        [weakSelf.jsContext evaluateScript:@"alert('替换原有jsClick2方法')"];
    };
    
    User *tempUser = [[User alloc] init];
    self.jsContext[@"user"] = tempUser;
    NSString *buyStr = @"user.buy('书籍')";
    [self.jsContext evaluateScript:buyStr];
    
    class_addProtocol([UIButton class], @protocol(UIButtonExportProtocol));
    
    self.jsContext[@"button"] = self.testButton;
    [self.jsContext evaluateScript:@"button.setTitleForState('FlyElephant 改变', 0)"];
}

@end
