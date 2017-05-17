//
//  GJDKDetailViewController.m
//  GJDKWeather
//
//  Created by Denesh on 12/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKDetailViewController.h"

@interface GJDKDetailViewController ()

@end

@implementation GJDKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.weatherDetailsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self fetchSavedData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark User Defined Methods
- (void)fetchSavedData {
    NSManagedObjectContext *managedObjectContext = [GJDKCoreDBManager sharedCoreDBManagerInstance].persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [WeatherDetails fetchRequest];
    NSArray *fetchResultArray = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    NSLog(@"%@", fetchResultArray);
    self.weatherDetailsArray = [fetchResultArray mutableCopy];
    NSLog(@"%@", self.weatherDetailsArray);
}

#pragma mark TableView Delegate and Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.weatherDetailsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJDKWeatherDetailsTableViewCell *weatherDetailsCell = [tableView dequeueReusableCellWithIdentifier:@"WeatherDetailsCellIdentifier"];
    weatherDetailsCell.cityLabel.text = ((WeatherDetails *)[self.weatherDetailsArray objectAtIndex:indexPath.row]).city;
    weatherDetailsCell.temperatureLabel.text = ((WeatherDetails *)[self.weatherDetailsArray objectAtIndex:indexPath.row]).temperature;
//    float kelvinValue = [((WeatherDetails *)[self.weatherDetailsArray objectAtIndex:indexPath.row]).temperature floatValue];
//    NSString *celsiusValue = [NSString stringWithFormat:@"%ld", (long)(kelvinValue - 273.15)];
//    weatherDetailsCell.temperatureLabel.text = [NSString stringWithFormat:@"%@ c", celsiusValue];
    return weatherDetailsCell;
}

@end
