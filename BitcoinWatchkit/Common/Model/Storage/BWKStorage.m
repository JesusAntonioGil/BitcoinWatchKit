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
        self.userDefaults =  [[NSUserDefaults alloc] initWithSuiteName:@"group.com.jesus.watchkit.GitHubStars"];
    }
    
    return self;
}

#pragma mark - PUBLIC

- (BWKBitcoin *)bitcoin
{
    NSData *myEncodedObject = [self.userDefaults objectForKey:@"bitcoin"];
    BWKBitcoin *bitcoin = (BWKBitcoin *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return bitcoin;
}

- (void)setBitcoin:(BWKBitcoin *)bitcoin
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:bitcoin];
    [self.userDefaults setObject:myEncodedObject forKey:@"bitcoin"];
    [self.userDefaults synchronize];
}

- (float)bitcoinValue
{
    return [self.userDefaults floatForKey:@"bitcoinValue"];
}

- (void)setBitcoinValue:(float)bitcoinValue
{
    [self.userDefaults setFloat:bitcoinValue forKey:@"bitcoinValue"];
    [self.userDefaults synchronize];
}

@end
