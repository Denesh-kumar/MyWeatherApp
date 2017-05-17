//
//  GJDKResultViewController.m
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKResultViewController.h"

@interface GJDKResultViewController ()

@end

@implementation GJDKResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues {
    if (self.cityWeatherDict) {
        NSString *cityName, *temperature;
        cityName = [self.cityWeatherDict valueForKey:@"CityName"];
        if (![[self.cityWeatherDict valueForKey:@"Temperature"] isKindOfClass:[NSString class]]) {
            temperature = [[self.cityWeatherDict valueForKey:@"Temperature"] stringValue];
        } else {
            temperature = [self.cityWeatherDict valueForKey:@"Temperature"];
        }
        float kelvinValue = [temperature floatValue];
        temperature = [NSString stringWithFormat:@"%ld", (long)(kelvinValue - 273.15)];
        self.cityNameLabel.text = cityName;
        self.temperatureLabel.text = [NSString stringWithFormat:@"%@ c", temperature];
    }
}

#pragma mark Action Methods
- (IBAction)saveDataButtonTapped:(id)sender {
    
    WeatherDetails *weatherDetails = [[WeatherDetails alloc] initWithContext:[GJDKCoreDBManager sharedCoreDBManagerInstance].persistentContainer.viewContext];
    
    weatherDetails.city = self.cityNameLabel.text;
    weatherDetails.temperature = self.temperatureLabel.text;
    [[GJDKCoreDBManager sharedCoreDBManagerInstance] saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
