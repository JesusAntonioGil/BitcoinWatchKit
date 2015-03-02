//
//  BWKBitcoinPresenter.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKBitcoinPresenter.h"
#import "BWKBitcoinCommunicator.h"


@interface BWKBitcoinPresenter ()

@property (strong, nonatomic) UIViewController<BWKBitcoinViewControllerInterface> *viewController;
@property (strong, nonatomic) BWKBitcoinCommunicator *bitcoinCommunicator;
@property (copy, nonatomic) void (^reply) (NSDictionary *);

@end

@implementation BWKBitcoinPresenter

- (BWKBitcoinCommunicator *)bitcoinCommunicator
{
    if(!_bitcoinCommunicator)
    {
        _bitcoinCommunicator = BWKBitcoinCommunicator.new;
    }
    
    return _bitcoinCommunicator;
}

- (instancetype)initWithViewController:(UIViewController<BWKBitcoinViewControllerInterface> *)viewController
{
    self = [super init];
    if(self)
    {
        self.viewController = viewController;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getBitcoinInformation) name:@"BWKRefreshNotification" object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BWKRefreshNotification" object:nil];
}

#pragma mark - NOTIFICATIONS

- (void)refreshWithNotification:(NSNotification *)notification
{
    self.reply = notification.object;
}

#pragma mark - PUBLIC

- (void)viewIsReady
{
    [self getBitcoinInformation];
}

- (void)getBitcoinInformation
{
    __weak BWKBitcoinPresenter *weakSelf = self;
    [self.bitcoinCommunicator actualBitcoinInformation:^(BWKBitcoin *bitcoin, NSError *error) {
        __strong BWKBitcoinPresenter *strongSelf = weakSelf;
        if(!error)
        {
            [strongSelf.viewController actualBitcoinInformation:bitcoin];
        }
        else
        {
            NSLog(@"Error: %@", error.description);
        }
    }];
}

- (void)replyToWatch
{
    if(self.reply)
    {
        self.reply(@{});
    }
}

@end
