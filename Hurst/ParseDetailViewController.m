//
//  ParseDetailViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "ParseDetailViewController.h"

@interface ParseDetailViewController ()

@end

@implementation ParseDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *stringURL = self.url;
    stringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *cleanedString = [stringURL stringByReplacingOccurrencesOfString:@"/%0A%09%09" withString:@""];
    
    NSURL *myURL = [NSURL URLWithString:cleanedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];

    [self.webView loadRequest:request];
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

@end
