//
//  GJDKWeatherDetailsCollection.m
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKWeatherDetailsCollection.h"

@implementation GJDKWeatherDetailsCollection

- (id)init {
    
    if ((self = [super init])) {
        self.weatherDetails = [[NSMutableArray alloc] init];
    }
    return self;
    
}

@end
