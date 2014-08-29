//
//  AppDelegate.m
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "AppDelegate.h"
#import "SwitchTabBarController.h"
#import "LocationsViewController.h"
#import "LoginViewController.h"
#import "DirectoryViewController.h"
#import "LocationsViewController.h"
#import "MoreViewController.h"
#import "MainMenuViewController.h"
#import "CustomMarkersViewController.h"
#import "LocViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize switchTabBarController = _switchTabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.switchTabBarController;

    
    [self initTabBar];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
 
    
    LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    lvc.delegate = self;
    [self.switchTabBarController presentModalViewController:lvc animated:NO];
//    [lvc release];
    
 [GMSServices provideAPIKey:@"AIzaSyDLkTZIlmtvEqH36PlaSfvT4d4Jw8oQSKk"];
    
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController2];
//    
//    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, navController,viewController3, viewController4, nil];
  
    
    return YES;
}

-(void)loginViewControllerDidFinish:(LoginViewController *)loginViewController {
    [self.switchTabBarController dismissModalViewControllerAnimated:NO];
}

-(void)initTabBar
{

    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    LocViewController *locViewController = [[LocViewController alloc]init];
    
//    CustomMarkersViewController *customMarkersViewController = [[CustomMarkersViewController alloc] init];
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc]init];
    DirectoryViewController *directoryViewController = [[DirectoryViewController alloc] init];
    LocationsViewController *locationsViewController = [[LocationsViewController alloc] init];
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    
    UINavigationController * LoginNav = [[UINavigationController alloc] initWithRootViewController:mainMenuViewController];
    UINavigationController * DirectoryNav = [[UINavigationController alloc] initWithRootViewController:directoryViewController];
    UINavigationController * LocationsNav = [[UINavigationController alloc] initWithRootViewController:locViewController];
    UINavigationController * MoreNav = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:LoginNav,DirectoryNav,LocationsNav,MoreNav,nil];
    LoginNav.title = @"LoginNav";
    DirectoryNav.title = @"DirectoryNav";
    LocationsNav.title = @"LocationsNav";
    MoreNav.title = @"MoreNav";
    
    NSArray *imgArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"tab_bar_1"],[UIImage imageNamed:@"tab_bar_7"],[UIImage imageNamed:@"tab_bar_3"],[UIImage imageNamed:@"tab_bar_4"],nil];
	
	_switchTabBarController = [[SwitchTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
	[_switchTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"mainpage_bottombg"]];
	[_switchTabBarController setTabBarTransparent:YES];
    [self.window addSubview:_switchTabBarController.view];
}

- (UIColor *)randomColor {
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        (time(NULL));
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end