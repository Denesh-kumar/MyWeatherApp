//
//  GJDKResultViewController.h
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJDKBaseViewController.h"
#import "WeatherDetails+CoreDataProperties.h"
#import "GJDKCoreDBManager.h"

@interface GJDKResultViewController : GJDKBaseViewController

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveDataButton;

- (IBAction)saveDataButtonTapped:(id)sender;

@property (nonatomic, strong) NSDictionary *cityWeatherDict;

@end
