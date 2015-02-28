//
//  BWKBitcoin.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKBitcoin.h"


@implementation BWKBitcoin

- (instancetype)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if(self)
    {
        self.avg = [json[@"24h_avg"] floatValue];
        self.ask = [json[@"ask"] floatValue];
        self.bid = [json[@"bid"] floatValue];
        self.last = [json[@"last"] floatValue];;
    }
    
    return self;
}

@end
