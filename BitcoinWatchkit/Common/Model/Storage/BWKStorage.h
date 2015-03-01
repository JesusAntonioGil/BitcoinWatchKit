//
//  BWKStorage.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 1/3/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWKBitcoin.h"


@interface BWKStorage : NSObject

@property (strong, nonatomic) BWKBitcoin *bitcoin;
@property (assign, nonatomic) float bitcoinValue;

+ (BWKStorage *)shared;

@end
