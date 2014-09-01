//
//  ViewController.m
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "MainMenuViewController.h"
#import "NewUserRegViewController.h"
#import "PortfolioViewController.h"
#import "DirectoryViewController.h"
#import "LocationsViewController.h"
#import "LoginViewController.h"
#import "MoreViewController.h"
#import "APPViewController.h"
#import "PhotoDownloader.h"


@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
@synthesize activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    self.view = mainView;
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout"         style:UIBarButtonItemStyleBordered target:self action:@selector(logoutButtonPressed)];
    
    self.navigationItem.rightBarButtonItem = cancelItem;
    self.navigationItem.title = @"Portfolio";
    
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor blackColor];
    [lblTitle setFrame:CGRectMake(40, 50+20, 300, 20)];
    lblTitle.backgroundColor=[UIColor clearColor];
    lblTitle.textColor=[UIColor blackColor];
    lblTitle.userInteractionEnabled=NO;
    lblTitle.text= @"Welcome to The Photo Schoppe";
    [self.view addSubview:lblTitle];

    UIButton *btnLocations = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnLocations addTarget:self action:@selector(syncButtonPressed)
           forControlEvents:UIControlEventTouchUpInside];
    [btnLocations setTitle:@"Sync" forState:UIControlStateNormal];
    btnLocations.frame = CGRectMake(120, 50+60, 100, 40);
    btnLocations.layer.borderWidth=1.0f;
    btnLocations.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnLocations];
    
    UIButton *btnPortfolio = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnPortfolio addTarget:self action:@selector(portfolioButtonPressed)
           forControlEvents:UIControlEventTouchUpInside];
    [btnPortfolio setTitle:@"Show" forState:UIControlStateNormal];
    btnPortfolio.frame = CGRectMake(120, 50+120, 100, 40);
    btnPortfolio.layer.borderWidth=1.0f;
    btnPortfolio.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnPortfolio];
    
//    UIButton *btnDirectory = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnDirectory addTarget:self action:@selector(directoryButtonPressed)
//           forControlEvents:UIControlEventTouchUpInside];
//    [btnDirectory setTitle:@"Directory" forState:UIControlStateNormal];
//    btnDirectory.frame = CGRectMake(120, 50+180, 100, 40);
//    btnDirectory.layer.borderWidth=1.0f;
//    btnDirectory.layer.borderColor=[[UIColor blackColor] CGColor];
//    [self.view addSubview:btnDirectory];
//    
//    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnMore addTarget:self action:@selector(moreButtonPressed)
//      forControlEvents:UIControlEventTouchUpInside];
//    [btnMore setTitle:@"More" forState:UIControlStateNormal];
//    btnMore.frame = CGRectMake(120, 50+240, 100, 40);
//    btnMore.layer.borderWidth=1.0f;
//    btnMore.layer.borderColor=[[UIColor blackColor] CGColor];
//    [self.view addSubview:btnMore];
    

    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(240, 110, 40.0, 40.0);
    [activityIndicator setHidesWhenStopped:YES];
    [self.view addSubview: activityIndicator];
//      [activityIndicator startAnimating];
  

    
}

- (void)doneButtonPressed {
    
    NewUserRegViewController *controller3 = [[NewUserRegViewController alloc] init];
    [self presentViewController:controller3 animated:YES completion:nil];
    
}

- (void)portfolioButtonPressed {
    
//    [activityIndicator startAnimating];
    [self pagerButtonPressed];
    
}

- (void)logoutButtonPressed {
    [self dismissModalViewControllerAnimated:YES];
    LoginViewController *controller3 = [[LoginViewController alloc] init];
    [self presentViewController:controller3 animated:YES completion:nil];

}

- (void)syncButtonPressed {
//    
//    LocationsViewController *controller2 = [[LocationsViewController alloc] init];
//    [[self navigationController] pushViewController:controller2 animated:YES];
        [activityIndicator startAnimating];
    
        PhotoDownloader *sampleProtocol = [[PhotoDownloader alloc]init];
        sampleProtocol.delegate = self;
        //        [myLabel setText:@"Processing..."];
        [sampleProtocol startSampleProcess];

    
//        APPViewController *controller2 = [[APPViewController alloc] init];
//        [[self navigationController] pushViewController:controller2 animated:YES];
}

- (void)directoryButtonPressed {
    
    DirectoryViewController *controller2 = [[DirectoryViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
}

- (void)moreButtonPressed {
    
    MoreViewController *controller2 = [[MoreViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pagerButtonPressed {
    
    APPViewController *controller2 = [[APPViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
//    
//    [activityIndicator startAnimating];
//    PhotoDownloader *sampleProtocol = [[PhotoDownloader alloc]init];
//    sampleProtocol.delegate = self;
//    //        [myLabel setText:@"Processing..."];
//    [sampleProtocol startSampleProcess];
//    
    
//    APPViewController *controller2 = [[APPViewController alloc] init];
//    [[self navigationController] pushViewController:controller2 animated:YES];
}

#pragma mark - Sample protocol delegate
-(void)processCompleted{
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
        

        
        [activityIndicator stopAnimating];
//        [activityIndicator removeFromSuperview];
        
        //        // perform on main
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Sync completed!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
        
//        APPViewController *controller2 = [[APPViewController alloc] init];
//        [[self navigationController] pushViewController:controller2 animated:YES];
        
    });
    

    
}

@end
