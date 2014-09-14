//
//  AppDelegate.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/17/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "ParseDetailViewController.h"
#import "ParseTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MapViewController.h"
#import "ContactViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"HELLLO THERE2");
    // Override point for customization after application launch.
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:0.188 green:0.471 blue:0.012 alpha:1]];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Parse shennanigans for push notifications
    [Parse setApplicationId:@"uv07JGkxqqZSjAlPI41yCBjV9AAS3HYXi98FYcFq"
                  clientKey:@"792mEhyJSKm3z4t1XfxFBU2W7c70crViPm6K8ZkD"];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|
     UIRemoteNotificationTypeSound];
    
    NSDictionary *pushDict = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if(pushDict)
    {
        [self application:application didReceiveRemoteNotification:pushDict];
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }
    
    NSLog(@"resigning active");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"Entering background");
//    [ParseDetailViewController dealloc];
    exit(0);

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"Entering foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Parse methods

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}



- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
    NSLog(@"%@", userInfo);
    
    if ([application applicationState]==UIApplicationStateInactive) {
        if ([userInfo objectForKey:@"post_id"]==nil) {
            return;
        }
        
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];

        UITabBarController* tbvc = (UITabBarController*) self.window.rootViewController;
        
        NSLog(@"tbvc is nil? %@", (tbvc==nil? @"YES": @"NO"));
        
        if (tbvc==nil){
            
            
            tbvc = (UITabBarController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"tbvc"];
            
            [self.window setRootViewController:tbvc];
            
            NSLog(@"NSArray of viewcontroller is nil? %@", (tbvc.viewControllers==nil? @"YES": @"NO"));
            
            FirstViewController* fvc = (FirstViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"fvc"];
            SecondViewController* svc = (SecondViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"svc"];
            MapViewController* mvc = (MapViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"mvc"];
            ContactViewController* cvc = (ContactViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"cvc"];
            UINavigationController* nvc = (UINavigationController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"nvc"];
            
            NSArray* arrayOfControllers= @[fvc, svc, mvc, nvc, cvc];
            
            [tbvc setViewControllers:arrayOfControllers];
            [tbvc setSelectedIndex:3];

            
            
        }
        else{
            
            NSNumber* postID = [userInfo objectForKey:@"post_id"];

            
            [tbvc setSelectedIndex:3];
            
            UINavigationController* nvc = (UINavigationController*)[tbvc selectedViewController];
            
            ParseDetailViewController* pdvc = (ParseDetailViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"pdvc"];
            
            NSString* postURL = [NSString stringWithFormat:@"http://hurst.jordanhudgens.com/?p=%i\n", postID.intValue];
            
            pdvc.url = postURL;
            
            [nvc addChildViewController:pdvc];
            
        }
    }
    
   
    
}




@end
