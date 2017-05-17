//
//  GJDKWebServiceManager.m
//  GJDKWeather
//
//  Created by Denesh on 11/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKWebServiceManager.h"

#define kBaseURL @"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=8726c36d19324fd1f9e2cf1d359a7760"
#define kBaseURLXML @"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=8726c36d19324fd1f9e2cf1d359a7760&mode=xml"
#define kIsJSONService 1

@implementation GJDKWebServiceManager

+ (id)sharedWebserviceManager {
    static GJDKWebServiceManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
//        someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
    }
    return self;
}

- (void)getWeatherDetails:(NSString *)cityName withCompletionHandler:(void (^)(NSDictionary *))weatherBlock {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURL *url = nil;
    
    if(kIsJSONService == 1) {
        url = [NSURL URLWithString:[NSString stringWithFormat:kBaseURL,cityName]];
    }
    else {
        url = [NSURL URLWithString:[NSString stringWithFormat:kBaseURLXML,cityName]];
    }
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            // If any error occurs then just display its description on the console.
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            if (kIsJSONService == 1) {
                NSError *error;
                NSDictionary *weatherDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                NSNumber *temperature = [weatherDict valueForKeyPath:@"main.temp"];
                NSString *cityNameFromDict = [weatherDict valueForKey:@"name"];
                NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] init]; //ObjectsAndKeys:temperature,
                                            //@"Temperature", cityNameFromDict, @"CityName", nil];
                [resultDict setObject:temperature forKey:@"Temperature"];
                [resultDict setObject:[NSString stringWithFormat:@"%@", cityNameFromDict] forKey:@"CityName"];
                NSLog(@"%@", resultDict);
                weatherBlock(resultDict);
            }
            else {
                self.weatherDetailsCollection = [GJDKWeatherDetailsCollectionParser loadWeatherDetailsCollection:data];
                GJDKWeatherDetails *weatherDetails = (GJDKWeatherDetails *)[self.weatherDetailsCollection.weatherDetails objectAtIndex:0];
                NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] init];
                [resultDict setObject:weatherDetails.cityName forKey:@"CityName"];
                [resultDict setObject:weatherDetails.temperature forKey:@"Temperature"];
                NSLog(@"The resulting weathr value is %@", resultDict);
                weatherBlock(resultDict);
                
            }
        }
    }];
    
    [dataTask resume];
}

@end
