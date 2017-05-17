//
//  GJDKWeatherDetails.m
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKWeatherDetails.h"

@implementation GJDKWeatherDetails

- (id)initWithCityName:(NSString *)cityName andWithTemperature :(NSString *)temperature {
    if ((self = [super init])) {
        self.cityName = cityName;
        self.temperature = temperature;
    }
    return self;
}

@end
