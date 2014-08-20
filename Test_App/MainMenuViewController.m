//
//  ViewController.m
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "MainMenuViewController.h"
#import "NewUserRegViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    [mainView setBackgroundColor:[UIColor yellowColor]];
    self.view = mainView;
    
    UINavigationBar *naviBarObj = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:naviBarObj];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Quit"         style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonPressed)];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"New User?" style:UIBarButtonItemStyleBordered target:self
                                                                action:@selector(doneButtonPressed)];
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Navigation Title"];
    navigItem.rightBarButtonItem = doneItem;
    navigItem.leftBarButtonItem = cancelItem;
    naviBarObj.items = [NSArray arrayWithObjects: navigItem,nil];
    [self.view addSubview:naviBarObj];
    
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.textColor = [UIColor blackColor];
        [lblTitle setFrame:CGRectMake(80, 50+20, 200, 20)];
        lblTitle.backgroundColor=[UIColor clearColor];
        lblTitle.textColor=[UIColor blackColor];
        lblTitle.userInteractionEnabled=NO;
        lblTitle.text= @"Welcome to The Photo Schoppe";
        [self.view addSubview:lblTitle];
    
    //    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [btnTest setBackgroundColor:[UIColor blueColor]];
    //    [btnTest setFrame:CGRectMake(0, 10, 200, 44)];
    //    [btnTest addTarget:self action:@selector(testBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:btnTest];
    //
    //    UIButton *btnTest2 = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [btnTest2 setBackgroundColor:[UIColor yellowColor]];
    //    [btnTest2 setFrame:CGRectMake(0 + 200 + 10, 10, 50, 44)];
    //    [self.view addSubview:btnTest2];
    //
    //    UIButton *btnTest3 = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [btnTest3 setBackgroundColor:[UIColor greenColor]];
    //    [btnTest3 setFrame:CGRectMake(0 + 200 + 10, 90, 50, 44)];
    //    [self.view addSubview:btnTest3];
    
    
    //    UILabel *lbl1 = [[UILabel alloc] init];
    //    /*important--------- */lbl1.textColor = [UIColor blackColor];
    //    [lbl1 setFrame:CGRectMake(0 + 200 + 10, 10, 100, 44)];
    //    lbl1.backgroundColor=[UIColor greenColor];
    //    lbl1.textColor=[UIColor blackColor];
    //    lbl1.userInteractionEnabled=NO;
    //    lbl1.text= @"Hello!";
    //    [self.view addSubview:lbl1];
    
    
}

- (void)doneButtonPressed {
    
    NewUserRegViewController *controller2 = [[NewUserRegViewController alloc] init];
    [self presentViewController:controller2 animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
