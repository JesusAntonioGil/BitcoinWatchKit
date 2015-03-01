//
//  BWKStorage.m
//  BitcoinWatchkit
//
//  Created by Jesus Antonio Gil on 1/3/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "BWKStorage.h"


@interface BWKStorage ()

@property (strong, nonatomic) NSUserDefaults *userDefaults;

@end

@implementation BWKStorage

+ (BWKStorage *)shared
{
    static BWKStorage *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BWKStorage alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.userDefaults =  [[NSUserDefaults alloc] initWithSuiteName:@"com.jesus.watchkit.BitcoinWatchkit"];
    }
    
    return self;
}

#pragma mark - PUBLIC



@end
