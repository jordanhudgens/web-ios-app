//
//  NewsViewController.h
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (assign, nonatomic) BOOL isLoading;

@end
