//
//  SecondViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/17/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "SecondViewController.h"
#import "NetworkCheckHelper.h"

@interface SecondViewController ()

@property (nonatomic, strong) NetworkCheckHelper *connected;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *urlAddress = @"http://hurstfs.com/inventory.php#inventoryHash";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.inventoryView loadRequest:request];
    
    [self.view addSubview:self.inventoryView];
    
    if (![self connected]) {
        NSLog(@"View 2: Uh oh, no internet");
    } else {
        NSLog(@"View 2: You're connected brah");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
