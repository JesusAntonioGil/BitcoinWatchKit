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

#pragma mark - Secure Coding

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeFloat:self.avg forKey:@"avg"];
    [aCoder encodeFloat:self.ask forKey:@"ask"];
    [aCoder encodeFloat:self.bid forKey:@"bid"];
    [aCoder encodeFloat:self.last forKey:@"last"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.avg = [aDecoder decodeFloatForKey:@"avg"];
        self.ask = [aDecoder decodeFloatForKey:@"ask"];
        self.bid = [aDecoder decodeFloatForKey:@"bid"];
        self.last = [aDecoder decodeFloatForKey:@"last"];
    }
    
    return self;
}

@end
