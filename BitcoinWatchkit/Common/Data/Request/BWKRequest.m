//
//  BWKRequest.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 28/2/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKRequest.h"


@implementation BWKRequest

+ (BWKRequest *)requestWithURL:(NSString *)stringURL
{
    BWKRequest *request = [[BWKRequest alloc] init];
    if(request)
    {
        request.url = [NSURL URLWithString:stringURL];
    }
    
    return request;
}

#pragma mark - PUBLIC

- (void)sendAsync:(BWKRequestCompletionHandler)completion
{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSHTTPURLResponse *responseHttp = (NSHTTPURLResponse *)response;
         BWKResponse *responseJson = [BWKResponse responseWithHTTPResponse:responseHttp data:data error:connectionError];
         
         if(responseJson)
         {
             completion(responseJson);
         }
     }];
}

@end
