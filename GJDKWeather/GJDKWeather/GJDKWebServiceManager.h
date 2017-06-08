//
//  GJDKWebServiceManager.h
//  GJDKWeather
//
//  Created by Denesh on 11/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GJDKWeatherDetailsCollectionParser.h"
#import "GJDKWeatherDetailsCollection.h"

@interface GJDKWebServiceManager : NSObject

+ (id)sharedWebserviceManager;

- (void)getWeatherDetails:(NSString *)cityName withCompletionHandler:(void (^)(NSDictionary *result))weatherBlock;

- (void)updateListedCityWeatherDetails:(NSMutableArray *)cityIds withCompletionHandler:(void (^)(NSDictionary *result))cityDetailsBlock;

@property (nonatomic, strong) GJDKWeatherDetailsCollection *weatherDetailsCollection;

@end
