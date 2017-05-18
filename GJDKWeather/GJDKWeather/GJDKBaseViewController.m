//
//  GJDKBaseViewController.m
//  GJDKWeather
//
//  Created by Denesh on 15/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

#import "GJDKBaseViewController.h"

@interface GJDKBaseViewController ()

@end

@implementation GJDKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Adding gif background
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Lightening" ofType:@"gif"];
//    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
//    UIWebView *gifWebView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    [gifWebView loadData:gifData MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:nil];
//    gifWebView.userInteractionEnabled = NO;
//    [self.view addSubview:gifWebView];
//    [self.view sendSubviewToBack:gifWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
