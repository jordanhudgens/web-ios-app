//
//  ParseDetailViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "ParseDetailViewController.h"
#import "MBProgressHUD.h"

@interface ParseDetailViewController () <UIWebViewDelegate>


@end

@implementation ParseDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.webView.delegate = self;
    
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        NSString *stringURL = self.url;
        stringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *cleanedString = [stringURL stringByReplacingOccurrencesOfString:@"/%0A%09%09" withString:@""];
        NSURL *myURL = [NSURL URLWithString:cleanedString];
        NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
        [self.webView loadRequest:request];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.webView animated:YES];
        });
    });
    
    [self.webView reload];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error : %@",error);
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.view removeFromSuperview];
    NSLog(@"View should be removed");
}

@end
