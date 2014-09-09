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
#import "TablieViewController.h"
#import "APPViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize splashView;
@synthesize switchTabBarController = _switchTabBarController;
@synthesize activityIndicator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.switchTabBarController;
    [self initTabBar];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [GMSServices provideAPIKey:@"AIzaSyDLkTZIlmtvEqH36PlaSfvT4d4Jw8oQSKk"];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        if (![NSThread isMainThread]) {
//            NSLog(@"Not in main thread 2..");
//        }
//        
//        NSLog(@"In main thread 2..");
    
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"flag_synced_once"]){
            //        [splashView removeFromSuperview];
            LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
            lvc.delegate = self;
            [self.switchTabBarController presentModalViewController:lvc animated:NO];
            return YES;
        }
        
//    });
    
    //    [lvc release];
    
   
    
    //    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController2];
    //
    //    self.tabBarController = [[UITabBarController alloc] init];
    //    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, navController,viewController3, viewController4, nil];
    
    
    

    
//    LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    lvc.delegate = self;
//    [self.switchTabBarController presentModalViewController:lvc animated:NO];
//    
    ////////
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        splashView = [[UIImageView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        splashView.image = [UIImage imageNamed:@"MyLaunchImage"];
        [self.window addSubview:splashView];
        
        activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.frame = CGRectMake(120, 240, 100, 100);
        activityIndicator.color = [UIColor whiteColor];
        [activityIndicator setHidesWhenStopped:YES];
        [self.splashView addSubview: activityIndicator];
        
        CGFloat labelX = activityIndicator.bounds.size.width + 2;
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 30, self.splashView.bounds.size.width - (labelX + 2), self.splashView.frame.size.height)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont boldSystemFontOfSize:12.0f];
        label.numberOfLines = 1;
        
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"Loading.. Please wait. ";
        
        [self.splashView addSubview:label];
        
        [activityIndicator startAnimating];
        
        //// load you web-service here and get data. After 2 sec iphone rootview controller will display
        [self performSelector:@selector(loadViewIphone) withObject:nil afterDelay:2.0];
        
        
    }
    return YES;

}

#pragma mark - Sample protocol delegate
-(void)photoDownloadProcessCompleted{
    //    [myLabel setText:@"Process Completed"];
    NSLog(@"Delegate fired ..");
    
    if (![NSThread isMainThread]) {
        NSLog(@"Not in main thread 1..");
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (![NSThread isMainThread]) {
            NSLog(@"Not in main thread 2..");
        }
        NSLog(@"In main thread 2..");

        
        NSLog(@"*** Accessing Directory Downloader data ....");
        DirectoryDataDownloader *sampleProtocol = [[DirectoryDataDownloader alloc]init];
        sampleProtocol.delegate = self;
        [sampleProtocol startDirectoryDownloadProcess];
        
    });
}

#pragma mark - Sample protocol delegate
-(void)directoryDownloadProcessCompleted{
    //    [myLabel setText:@"Process Completed"];
    NSLog(@"Delegate fired ..");
    
    if (![NSThread isMainThread]) {
        NSLog(@"Not in main thread 1..");
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (![NSThread isMainThread]) {
            NSLog(@"Not in main thread 2..");
        }
        
        NSLog(@"In main thread 2..");
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:YES forKey:@"flag_synced_once"];
        [defaults synchronize];
        
        [activityIndicator stopAnimating];
        [splashView removeFromSuperview];
        
        LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        lvc.delegate = self;
        [self.switchTabBarController presentModalViewController:lvc animated:NO];
        //        APPViewController *controller2 = [[APPViewController alloc] init];
        //        [[self navigationController] pushViewController:controller2 animated:YES];
        
    });
    
    
    
}


-(void)loadViewIphone
{
    PhotoDownloader *sampleProtocol = [[PhotoDownloader alloc]init];
    sampleProtocol.delegate = self;
    //        [myLabel setText:@"Processing..."];
    [sampleProtocol startPhotoDownloadProcess];
}

-(void)loginViewControllerDidFinish:(LoginViewController *)loginViewController {
    [self.switchTabBarController dismissModalViewControllerAnimated:NO];
}

-(void)initTabBar
{

    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    LocViewController *locViewController = [[LocViewController alloc]init];
    APPViewController *appViewController = [[APPViewController alloc] init];
    
//    CustomMarkersViewController *customMarkersViewController = [[CustomMarkersViewController alloc] init];
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc]init];
    TablieViewController *directoryViewController = [[TablieViewController alloc] init];
    LocationsViewController *locationsViewController = [[LocationsViewController alloc] init];
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    
    UINavigationController * LoginNav = [[UINavigationController alloc] initWithRootViewController:appViewController];
    UINavigationController * DirectoryNav = [[UINavigationController alloc] initWithRootViewController:directoryViewController];
    UINavigationController * LocationsNav = [[UINavigationController alloc] initWithRootViewController:locViewController];
    UINavigationController * MoreNav = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:LoginNav,LocationsNav,DirectoryNav,MoreNav,nil];
    LoginNav.title = @"LoginNav";
    LocationsNav.title = @"LocationsNav";
    DirectoryNav.title = @"DirectoryNav";
    MoreNav.title = @"MoreNav";
    
    NSArray *imgArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"tab_bar_1"],[UIImage imageNamed:@"tab_bar_3"],[UIImage imageNamed:@"tab_bar_7"],[UIImage imageNamed:@"tab_bar_4"],nil];
	
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