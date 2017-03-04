//
//  ENWebViewController.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "EWNativeFunctionManager.h"
#import "WYWebProgressLayer.h"

@interface ENWebViewController ()<UIWebViewDelegate>

@property (nonatomic , strong) UIWebView *webView;

@property(nonatomic,strong) JSContext *context;

@property (nonatomic , strong) EWNativeFunctionManager *native;
//进度条
@property (nonatomic , strong) WYWebProgressLayer *layer;
@end

@implementation ENWebViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"H5界面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addWebView];
    [self addProgressIndicator];
}

- (void)dealloc{
    [self.layer closeTimer];
    [self.layer removeFromSuperlayer];
    self.layer = nil;
}

#pragma mark - init methods

- (void)addWebView{
    [self.view addSubview:self.webView];
    [self setWebViewFrame];
}

- (void)setWebViewFrame{
    self.webView.frame = self.view.bounds;
}

- (void)addProgressIndicator{
    //添加进度条
    [self.view.layer addSublayer:self.layer];
}

#pragma mark - webView Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.layer startLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.layer finishedLoad];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //生成一个对应的js环境
    self.context[@"ening"] = self.native;
    //进度条停止
    [self.layer finishedLoad];
    //回调用户信息到js
    [EWNativeInfoManager getNativeAccountInfoByJSContext:self.context];
}

#pragma mark - event response


#pragma mark - getter

- (EWNativeFunctionManager *)native{
    if (!_native) {
        _native = [[EWNativeFunctionManager alloc] initWithViewController:self];
    }
    return _native;
}

/*
 *懒加载一个js环境
 */
- (JSContext *)context{
    if (!_context) {
        _context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    }
    return _context;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        NSString *string = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
        NSURL *url = [NSURL URLWithString:string];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (WYWebProgressLayer *)layer{
    
    if (!_layer) {
        _layer = [[WYWebProgressLayer alloc] init];
        _layer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 6 * HeightFor1920);
    }
    return _layer;
}


@end
