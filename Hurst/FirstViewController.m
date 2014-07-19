//
//  FirstViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/17/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *urlAddress = @"http://hurstfs.com";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.homepageView loadRequest:request];
    
    [self.view addSubview:self.homepageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
