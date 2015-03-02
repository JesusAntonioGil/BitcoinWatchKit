//
//  BWKBitcoinViewController.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKBitcoinViewController.h"
#import "BWKBitcoinPresenter.h"
#import "BWKStorage.h"


@interface BWKBitcoinViewController () <BWKBitcoinViewControllerInterface>

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *differenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (strong, nonatomic) BWKBitcoinPresenter *presenter;
@property (strong, nonatomic) BWKBitcoin *lastBitcoin;

@end


@implementation BWKBitcoinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.presenter = [[BWKBitcoinPresenter alloc] initWithViewController:self];
    [self.presenter viewIsReady];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - ACTIONS

- (IBAction)onRefreshButtonTap:(id)sender
{
    [self refreshBitcoinInformation];
}

#pragma mark - PRIVATE

- (void)refreshBitcoinInformation
{
    [self.presenter getBitcoinInformation];
}

- (NSString *)stringDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm dd/MM/yyyy"];
    
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark - DELEGATES
#pragma mark - Presenter delegate

- (void)actualBitcoinInformation:(BWKBitcoin *)bitcoin
{
    self.valueLabel.text = [NSString stringWithFormat:@"%.02f€", bitcoin.avg];
    
    self.differenceLabel.hidden = (self.lastBitcoin) ? NO : YES;
    
    if(bitcoin.ask >= self.lastBitcoin.ask)
    {
        self.differenceLabel.text = [NSString stringWithFormat:@"+%.02f BTC", (bitcoin.ask - self.lastBitcoin.ask)];
        self.differenceLabel.textColor = [UIColor greenColor];
    }
    else
    {
        self.differenceLabel.text = [NSString stringWithFormat:@"-%.02f BTC", (self.lastBitcoin.ask - bitcoin.ask)];
        self.differenceLabel.textColor = [UIColor redColor];
    }
    
    self.lastUpdatedLabel.text = [self stringDate:[NSDate date]];
        
    self.lastBitcoin = bitcoin;
    
    [BWKStorage shared].bitcoin = bitcoin;
    [BWKStorage shared].bitcoinValue = bitcoin.avg;
    
    [self.presenter replyToWatch];
}

@end
