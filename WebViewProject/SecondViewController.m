//
//  SecondViewController.m
//  WebViewProject
//
//  Created by Aditya Narayan on 6/21/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    WKWebViewConfiguration * theConfiguration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.container.frame configuration:theConfiguration];
    self.webView.navigationDelegate = self;
    
    NSString * htmlFile = [[NSBundle mainBundle] pathForResource:@"erica" ofType:@"html"];
    NSString * htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)webView:(WKWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(WKNavigationType)navigationType {
    
    if (navigationType == WKNavigationTypeFormSubmitted) {
        [self htmlButtonClicked];
    }
    return true;
}


//        UIApplication.sharedApplication().openURL(navigationAction.request.URL)



- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler {
    if (navigationAction.navigationType == WKNavigationTypeOther) {
        decisionHandler(WKNavigationActionPolicyAllow);
    } else if (navigationAction.navigationType == WKNavigationTypeFormSubmitted) {
        decisionHandler(WKNavigationActionPolicyAllow);
        [self htmlButtonClicked];
    } else {
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}




- (void)htmlButtonClicked {
    NSLog(@"You clicked the html button.");
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithCompletionHandler:(void (^)(void))completionHandler {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Mayday! Mayday!"
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * action) {
                                                          completionHandler();
                                                      }]];
    [self presentViewController:alertController animated:YES completion:^{}];
}


- (IBAction)buttonClicked:(id)sender {
    [self webView:self.webView runJavaScriptAlertPanelWithCompletionHandler:^{
    }
     ];
}

@end
