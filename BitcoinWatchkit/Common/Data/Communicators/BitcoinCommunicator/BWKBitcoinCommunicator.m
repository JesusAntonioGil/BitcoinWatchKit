//
//  BWKBitcoinCommunicator.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKBitcoinCommunicator.h"
#import "BWKRequest.h"
#import "BWKResponse.h"
#import "BWKBitcoin.h"
#import "BWKConfig.h"


@implementation BWKBitcoinCommunicator

- (void)actualBitcoinInformation:(BWKBitcoinCommunicatorCompletionHandler)completion
{
    BWKRequest *request = [BWKRequest requestWithURL:BWKBitcoinURLInfomation];
    [request sendAsync:^(BWKResponse *response) {
        if(completion)
        {
            BWKBitcoin *bitcoin = [[BWKBitcoin alloc] initWithJSON:response.body];
            completion(bitcoin, response.error);
        }
    }];
}

@end
