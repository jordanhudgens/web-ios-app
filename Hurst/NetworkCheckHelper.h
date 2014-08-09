//
//  NetworkCheckHelper.h
//  Hurst
//
//  Created by Jordan Hudgens on 8/9/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface NetworkCheckHelper : NSObject

- (BOOL)connected;

@end
