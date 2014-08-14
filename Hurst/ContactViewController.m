//
//  ContactViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "ContactViewController.h"
#import "NetworkCheckHelper.h"

@interface ContactViewController ()

@property (nonatomic, strong) NetworkCheckHelper *checker;
@property (strong, nonatomic) IBOutlet UIImageView *offlineImageView;
@property (strong, nonatomic) IBOutlet UIImageView *offlineImage;
@property (strong, nonatomic) IBOutlet UITextView *offlineTextView;

@end

@implementation ContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.checker = [[NetworkCheckHelper alloc] init];
    
    if ([self.checker connected]) {
        NSString *urlAddress = @"http://hurstfs.com/contact.php#contactUs";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
        
        [self.view addSubview:self.webView];
        
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
