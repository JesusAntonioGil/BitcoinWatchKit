//
//  BWKStorage.h
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 1/3/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BWKStorage : NSObject

@property (strong, nonatomic) NSString *title;

+ (BWKStorage *)shared;

@end
