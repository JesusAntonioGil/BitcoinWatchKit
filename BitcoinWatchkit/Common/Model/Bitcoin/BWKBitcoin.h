//
//  BWKBitcoin.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BWKBitcoin : NSObject

@property (assign, nonatomic) float avg;
@property (assign, nonatomic) float ask;
@property (assign, nonatomic) float bid;
@property (assign, nonatomic) float last;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
