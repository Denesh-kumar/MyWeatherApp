//
//  GJDKWeatherDetailsCollectionParser.m
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKWeatherDetailsCollectionParser.h"

@implementation GJDKWeatherDetailsCollectionParser

+ (GJDKWeatherDetailsCollection *)loadWeatherDetailsCollection:(NSData *)xmlData {
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) {
        return nil;
    }
    NSLog(@"%@", doc.rootElement);
    
    GJDKWeatherDetailsCollection *weatherDetailCollection = [[GJDKWeatherDetailsCollection alloc] init];
    
    NSString *temperatureValue, *cityNameValue, *cityIdValue;
    
    NSArray *weatherDetailCollectionsForTemperature = [doc.rootElement elementsForName:@"temperature"];
    for (GDataXMLElement *weatherDetailCollectionTemperature in weatherDetailCollectionsForTemperature) {
        NSArray *temperatureAttributes = [weatherDetailCollectionTemperature attributes];
        if (temperatureAttributes.count > 0) {
            GDataXMLNode *temperatureValueNode = (GDataXMLNode *)[weatherDetailCollectionTemperature attributeForName:@"value"];
            temperatureValue = [temperatureValueNode stringValue];
        }
    }
    
    
    NSArray *weatherDetailCollectionsForCity = [doc.rootElement elementsForName:@"city"];
    for (GDataXMLElement *weatherDetailCollectionCity in weatherDetailCollectionsForCity) {
        GDataXMLNode *cityNameNode = (GDataXMLNode *)[weatherDetailCollectionCity attributeForName:@"name"];
        GDataXMLNode *cityIdNode = (GDataXMLNode *)[weatherDetailCollectionCity attributeForName:@"id"];
        cityNameValue = [cityNameNode stringValue];
        cityIdValue = [cityIdNode stringValue];
    }
    
    
    GJDKWeatherDetails *weatherDetails = [[GJDKWeatherDetails alloc] initWithCityName:cityNameValue withCityId:cityIdValue andWithTemperature:temperatureValue];
    [weatherDetailCollection.weatherDetails addObject:weatherDetails];
    
    return weatherDetailCollection;
}

@end
