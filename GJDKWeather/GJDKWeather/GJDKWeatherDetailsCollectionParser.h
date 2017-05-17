//
//  GJDKWeatherDetailsCollectionParser.h
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import "GJDKWeatherDetailsCollection.h"
#import "GJDKWeatherDetails.h"

@interface GJDKWeatherDetailsCollectionParser : NSObject

+ (GJDKWeatherDetailsCollection *)loadWeatherDetailsCollection:(NSData *)xmlData;

@end
