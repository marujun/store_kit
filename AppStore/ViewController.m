//
//  ViewController.m
//  AppStore
//
//  Created by marujun on 13-4-24.
//  Copyright (c) 2013年 马汝军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Go to App Store" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0.0, 0.0, 200.0, 44.0)];
    [button setCenter:self.view.center];
    [self.view addSubview:button];
    // Add Target-Action Pair
    [button addTarget:self action:@selector(openAppStore:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)openAppStore:(id)sender {
    // Initialize Product View Controller
    SKStoreProductViewController *storeProductViewController = [[SKStoreProductViewController alloc] init];
    // Configure View Controller
    [storeProductViewController setDelegate:self];
    NSLog(@"开始进入 app store !");
    [storeProductViewController loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier : @"624943984"}
                                          completionBlock:^(BOOL result, NSError *error) {
                                              if (error) {
                                                  NSLog(@"Error %@ with User Info %@.", error, [error userInfo]);
                                              } else {
                                                  // Present Store Product View Controller
                                                  [self presentViewController:storeProductViewController animated:YES completion:nil];        
                                              }     
                                          }]; 
}


#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"已从 app store 返回本应用!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
