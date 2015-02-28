//
//  BWKRequest.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWKResponse.h"


typedef void(^BWKRequestCompletionHandler)(BWKResponse *response);

@interface BWKRequest : NSObject

@property (strong, nonatomic) NSURL *url;

+ (BWKRequest *)requestWithURL:(NSString *)stringURL;
- (void)sendAsync:(BWKRequestCompletionHandler)completion;

@end
