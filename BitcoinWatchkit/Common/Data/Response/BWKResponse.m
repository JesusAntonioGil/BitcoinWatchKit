//
//  BWKResponse.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKResponse.h"


@implementation BWKResponse

+ (BWKResponse *)responseWithHTTPResponse:(NSHTTPURLResponse *)responseHttp data:(NSData *)data error:(NSError *)error
{
    NSError *errorJson = nil;
    NSDictionary *json = data ? [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errorJson] : nil;
    
    BWKResponse *response = [[BWKResponse alloc] init];
    response.url = [responseHttp.URL absoluteString];
    response.data = data;
    response.error = error;
    
    if(json)
    {
        response.status = YES;
        response.body = json;
    }
    
    return response;
}

@end
