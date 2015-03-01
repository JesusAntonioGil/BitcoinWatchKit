//
//  InterfaceController.m
//  BitcoinWatchkit WatchKit Extension
//
//  Created by Jesus Antonio Gil on 1/3/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *valueLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *refreshButton;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
}

- (void)willActivate
{
    [super willActivate];
}

- (void)didDeactivate
{
    [super didDeactivate];
}

#pragma mark - ACTIONS

- (IBAction)onRefreshButtonTap
{
    NSDictionary *appData = @{@"action": @"refresh"};
    
    [WKInterfaceController openParentApplication:appData reply:^(NSDictionary *replyInfo, NSError *error) {
         NSLog(@"%@ %@",replyInfo, error);
    }];
}

@end



