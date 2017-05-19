//
//  GJDKWeatherDetails.m
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKWeatherDetails.h"

@implementation GJDKWeatherDetails

- (id)initWithCityName:(NSString *)cityName withCityId:(NSString *)cityId andWithTemperature :(NSString *)temperature {
    if ((self = [super init])) {
        self.cityName = cityName;
        self.temperature = temperature;
        self.cityId = cityId;
    }
    return self;
}

@end
