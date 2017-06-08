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
    
    UIBarButtonItem *navigationBarRightButton = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refreshCityWeatherDetails)];
    self.navigationItem.rightBarButtonItem = navigationBarRightButton;
    
    self.weatherDetailsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.weatherDetailsArray = [[GJDKCoreDBManager fetchSavedWeatherData] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark User Defined Methods
- (void)refreshCityWeatherDetails {
    [self.weatherDetailsArray removeAllObjects];
    
    NSMutableArray *cityIds = [GJDKCoreDBManager cityIds];
    [GJDKCoreDBManager deleteAllRecords];
    
    GJDKWebServiceManager *webserviceManager = [GJDKWebServiceManager sharedWebserviceManager];
    [webserviceManager updateListedCityWeatherDetails:cityIds withCompletionHandler:^(NSDictionary *result) {
        NSLog(@"Refreshed Details are %@", result);
        
        NSArray *cityArray = [result valueForKey:@"list"];
        NSDictionary *cityDetail;
        for (int index = 0; index < [cityArray count]; index++) {
            cityDetail = (NSDictionary *)[cityArray objectAtIndex:index];
            NSLog(@"%@", cityDetail);
            WeatherDetails *weatherDetails = [[WeatherDetails alloc] initWithContext:[GJDKCoreDBManager sharedCoreDBManagerInstance].persistentContainer.viewContext];
            weatherDetails.cityId = [[cityDetail valueForKey:@"id"] stringValue];
            weatherDetails.city = [cityDetail valueForKey:@"name"];
            NSString *temperature = [[cityDetail valueForKeyPath:@"main.temp"] stringValue];
            weatherDetails.temperature = [NSString stringWithFormat:@"%@ c", temperature];
            [[GJDKCoreDBManager sharedCoreDBManagerInstance] saveContext];
        }
        
        self.weatherDetailsArray = [[GJDKCoreDBManager fetchSavedWeatherData] mutableCopy];
        
        NSOperationQueue *mainqueue = [NSOperationQueue mainQueue];
        [mainqueue addOperationWithBlock:^{
            [self.weatherDetailsTableView reloadData];
        }];
    }];
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
