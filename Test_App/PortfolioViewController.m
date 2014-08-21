//
//  PortfolioViewController.m
//  iOS-ThePhotoSchoppe
//
//  Created by Harsha Siriwardena on 8/21/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "PortfolioViewController.h"
#import "XMLWebImagesViewController.h"

@interface PortfolioViewController ()

@end

@implementation PortfolioViewController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    lblTitle.text= @"Portfolio";
    [self.view addSubview:lblTitle];
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnClose addTarget:self action:@selector(testButtonPressed)
       forControlEvents:UIControlEventTouchUpInside];
    [btnClose setTitle:@"Close" forState:UIControlStateNormal];
    btnClose.frame = CGRectMake(60, 50+100, 100, 40);
    btnClose.layer.borderWidth=1.0f;
    btnClose.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnClose];
    
}

- (void)testButtonPressed {
    
    
    XMLWebImagesViewController *controller2 = [[XMLWebImagesViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
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
