//
//  MoreViewController.m
//  iOS-ThePhotoSchoppe
//
//  Created by Harsha Siriwardena on 8/21/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
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
    [lblTitle setFrame:CGRectMake(40, 50+20, 300, 20)];
    lblTitle.backgroundColor=[UIColor clearColor];
    lblTitle.textColor=[UIColor blackColor];
    lblTitle.userInteractionEnabled=NO;
    lblTitle.text= @"More";
    [self.view addSubview:lblTitle];
    
    
//    Display the contact information (address, phone number and email address)
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
