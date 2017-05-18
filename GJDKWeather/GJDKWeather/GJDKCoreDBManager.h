//
//  GJDKCoreDBManager.h
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "WeatherDetails+CoreDataClass.h"

@interface GJDKCoreDBManager : NSObject

//@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

+ (GJDKCoreDBManager *)sharedCoreDBManagerInstance;

- (void)saveContext;

+ (NSMutableArray *)fetchSavedWeatherData;

@end
