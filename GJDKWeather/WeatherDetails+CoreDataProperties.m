//
//  WeatherDetails+CoreDataProperties.m
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "WeatherDetails+CoreDataProperties.h"

@implementation WeatherDetails (CoreDataProperties)

+ (NSFetchRequest<WeatherDetails *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"WeatherDetails"];
}

@dynamic temperature;
@dynamic city;

@end
