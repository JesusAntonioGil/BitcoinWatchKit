//
//  BWKBitcoinCommunicator.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWKBitcoin.h"


typedef void(^BWKBitcoinCommunicatorCompletionHandler)(BWKBitcoin *bitcoin, NSError *error);

@interface BWKBitcoinCommunicator : NSObject

- (void)actualBitcoinInformation:(BWKBitcoinCommunicatorCompletionHandler)completion;

@end
