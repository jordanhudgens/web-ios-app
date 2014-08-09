//
//  NetworkCheckHelper.m
//  Hurst
//
//  Created by Jordan Hudgens on 8/9/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "NetworkCheckHelper.h"

@implementation NetworkCheckHelper

- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

@end
