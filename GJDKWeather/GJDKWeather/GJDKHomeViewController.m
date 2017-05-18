//
//  ViewController.m
//  GJDKWeather
//
//  Created by Denesh on 11/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKHomeViewController.h"

@interface GJDKHomeViewController ()

@end

@implementation GJDKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[GJDKCoreDBManager fetchSavedWeatherData] count] > 0) {
        [self.showSavedDataButton setHidden:NO];
    }
    else {
        [self.showSavedDataButton setHidden:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetailSegue1"]) {
        GJDKResultViewController *resultViewController = (GJDKResultViewController *)segue.destinationViewController;
        if (self.cityWeatherDict) {
            resultViewController.cityWeatherDict = self.cityWeatherDict;
        }
    }
}

#pragma mark TextField Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length > 0) {
        [self.TemperatureButton setEnabled:YES];
    }
    else if (string.length == 0) {
        [self.TemperatureButton setEnabled:NO];
    }
    NSLog(@"%lu", textField.text.length);
    return YES;
}

#pragma mark Action methods

- (IBAction)TemperatureButtonTapped:(id)sender {
    [self.CityNameTextField resignFirstResponder];
    GJDKWebServiceManager *webserviceManager = [GJDKWebServiceManager sharedWebserviceManager];
    [webserviceManager getWeatherDetails:self.CityNameTextField.text withCompletionHandler:^(NSDictionary *result) {
        self.cityWeatherDict = result;
        NSOperationQueue *queue = [NSOperationQueue mainQueue];
        [queue addOperationWithBlock:^{
            [self performSegueWithIdentifier:@"showDetailSegue1" sender:self];
        }];
    }];
}

- (IBAction)showSavedDataButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"showSavedDataSegue" sender:self];
}

@end
