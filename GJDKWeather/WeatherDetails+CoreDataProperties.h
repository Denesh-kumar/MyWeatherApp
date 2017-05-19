//
//  WeatherDetails+CoreDataProperties.h
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "WeatherDetails+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherDetails (CoreDataProperties)

+ (NSFetchRequest<WeatherDetails *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *temperature;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *cityId;


@end

NS_ASSUME_NONNULL_END
