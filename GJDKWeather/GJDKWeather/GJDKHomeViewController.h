//
//  ViewController.h
//  GJDKWeather
//
//  Created by Denesh on 11/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJDKBaseViewController.h"
#import "GJDKWebServiceManager.h"
#import "GJDKResultViewController.h"
#import "GJDKDetailViewController.h"

@interface GJDKHomeViewController : GJDKBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *CityNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *TemperatureButton;
@property (weak, nonatomic) IBOutlet UIButton *showSavedDataButton;


@property (nonatomic, strong) NSDictionary *cityWeatherDict;

- (IBAction)TemperatureButtonTapped:(id)sender;
- (IBAction)showSavedDataButtonTapped:(id)sender;

@end

