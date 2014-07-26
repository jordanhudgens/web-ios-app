//
//  ParseTableViewController.h
//  Hurst
//
//  Created by Jordan Hudgens on 7/25/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParseTableViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
