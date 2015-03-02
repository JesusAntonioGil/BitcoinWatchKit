//
//  BWKBitcoinPresenter.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BWKBitcoin.h"


@protocol BWKBitcoinViewControllerInterface <NSObject>

- (void)actualBitcoinInformation:(BWKBitcoin *)bitcoin;

@end


@interface BWKBitcoinPresenter : NSObject

- (instancetype)initWithViewController:(UIViewController<BWKBitcoinViewControllerInterface> *)viewController;
- (void)viewIsReady;
- (void)getBitcoinInformation;
- (void)replyToWatch;

@end
