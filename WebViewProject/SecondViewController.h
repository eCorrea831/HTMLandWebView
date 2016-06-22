//
//  SecondViewController.h
//  WebViewProject
//
//  Created by Aditya Narayan on 6/21/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface SecondViewController : UIViewController <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UIView * container;
@property (nonatomic, retain) WKWebView * webView;
@property (retain, nonatomic) NSURL * url;

- (IBAction)buttonClicked:(id)sender;

@end
