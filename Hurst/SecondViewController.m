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

@property (nonatomic, strong) NetworkCheckHelper *checker;
@property (strong, nonatomic) IBOutlet UIImageView *offlineImage;
@property (strong, nonatomic) IBOutlet UITextView *offlineTextView;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    self.checker = [[NetworkCheckHelper alloc] init];
    
    if ([self.checker connected]) {
        NSString *urlAddress = @"http://hurstfs.com/inventory.php#inventoryHash";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.inventoryView loadRequest:request];
        
        [self.view addSubview:self.inventoryView];
        
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
