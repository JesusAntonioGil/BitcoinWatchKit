//
//  BWKResponse.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BWKResponse : NSObject

@property (strong, nonatomic) NSString *url;
@property (assign, nonatomic) BOOL status;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) id body;		// NSDictionary | NSArray | UIImage
@property (strong, nonatomic) NSData *data;


+ (BWKResponse *)responseWithHTTPResponse:(NSHTTPURLResponse *)responseHttp data:(NSData *)data error:(NSError *)error;

@end
