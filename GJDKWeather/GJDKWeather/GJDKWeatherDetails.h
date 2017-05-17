//
//  GJDKWeatherDetails.h
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJDKWeatherDetails : NSObject

@property (nonatomic, strong) NSString *cityName;

@property (nonatomic, strong) NSString *temperature;

- (id)initWithCityName:(NSString *)cityName andWithTemperature:(NSString *)temperature;

@end
