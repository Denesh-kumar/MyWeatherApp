//
//  GJDKDetailViewController.h
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJDKBaseViewController.h"
#import "GJDKWeatherDetailsTableViewCell.h"
#import "WeatherDetails+CoreDataClass.h"
#import "WeatherDetails+CoreDataProperties.h"
#import "GJDKCoreDBManager.h"
#import "GJDKWebServiceManager.h"

@interface GJDKDetailViewController : GJDKBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *weatherDetailsTableView;

@property (nonatomic, strong) NSMutableArray *weatherDetailsArray;

@end
