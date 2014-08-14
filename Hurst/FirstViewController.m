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
@property (strong, nonatomic) IBOutlet UIImageView *offlineImage;
@property (strong, nonatomic) IBOutlet UITextView *offlineTextView;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {

    self.checker = [[NetworkCheckHelper alloc] init];
    
    if ([self.checker connected]) {
        NSString *urlAddress = @"http://hurstfs.com";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.homepageView loadRequest:request];
        
        [self.view addSubview:self.homepageView];
        
        self.offlineTextView.text = @"";
        self.offlineImage.image = nil;
        NSLog(@"Connection looks good from here");
    } else {
        self.offlineTextView.editable = NO;
        self.offlineTextView.dataDetectorTypes = UIDataDetectorTypeAll;
        NSLog(@"No connection");
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [NSURLConnection cancelPreviousPerformRequestsWithTarget:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
