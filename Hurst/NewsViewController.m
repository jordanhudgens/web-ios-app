//
//  NewsViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "NewsViewController.h"
#import "MBProgressHUD.h"

@implementation NewsViewController

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
    
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSString *urlAddress = @"http://hurst.jordanhudgens.com/";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.webView animated:YES];
        });
    });
    
    
    
    
    
    
    
    [self.view addSubview:self.webView];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.webView reload];
}


#pragma mark - Call to activity loader



@end
