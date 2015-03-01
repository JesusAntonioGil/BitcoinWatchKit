//
//  InterfaceController.m
//  BitcoinWatchkit WatchKit Extension
//
//  Created by Jesus Antonio Gil on 1/3/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "InterfaceController.h"
#import "BWKStorage.h"


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
    
    [self setViewInformation];
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
    }];
}

#pragma mark - NOTIFICATIONS

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(UILocalNotification *)localNotification
{
    if([identifier isEqualToString:@"refreshWath"])
    {
        [self setViewInformation];
    }
}

#pragma mark - PRIVATE

- (void)setViewInformation
{
    if([BWKStorage shared].bitcoinValue)
    {
        [self.valueLabel setHidden:NO];
        [self.valueLabel setText:[NSString stringWithFormat:@"%.02f€", [BWKStorage shared].bitcoinValue]];
    }
}

@end



