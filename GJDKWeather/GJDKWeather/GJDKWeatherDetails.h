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

@property (nonatomic, strong) NSString *cityId;

- (id)initWithCityName:(NSString *)cityName withCityId:(NSString *)cityId andWithTemperature:(NSString *)temperature;

@end
