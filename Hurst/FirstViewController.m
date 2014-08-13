//
//  FirstViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/17/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "FirstViewController.h"
#import "NetworkCheckHelper.h"

@interface FirstViewController ()

@property (nonatomic, strong) NetworkCheckHelper *checker;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSString *urlAddress = @"http://hurstfs.com";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.homepageView loadRequest:request];
    
    [self.view addSubview:self.homepageView];
    
    self.checker = [[NetworkCheckHelper alloc] init];
    
    if (![self.checker connected]) {
        self.statusLabel.text = @"";
    } else {
        self.statusLabel.text = @"This page requires an Internet connection";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
