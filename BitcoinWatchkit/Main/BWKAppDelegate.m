//
//  AppDelegate.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKAppDelegate.h"


@interface BWKAppDelegate ()

@end


@implementation BWKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    NSString *action = userInfo[@"action"];
    if([action isEqualToString:@"refresh"])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BWKRefreshNotification" object:nil];
    }
}


@end
