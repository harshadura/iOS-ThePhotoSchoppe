//
//  ViewController.m
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "LoginViewController.h"
#import "MainMenuViewController.h"
#import "NewUserRegViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize textFieldUsername, textFieldPassword;

#pragma mark - system methods
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
    
    //    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Quit" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonPressed)];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"New User?" style:UIBarButtonItemStyleBordered target:self
                                                                action:@selector(doneButtonPressed)];
    
    UIBarButtonItem *bypassItem = [[UIBarButtonItem alloc] initWithTitle:@">>>" style:UIBarButtonItemStyleBordered target:self
                                                                action:@selector(bypassButtonPressed)];
  
    
    [self.navigationItem setTitle:@"User Login"];
    [self.navigationItem setRightBarButtonItem: doneItem];
    [self.navigationItem setLeftBarButtonItem:  bypassItem];
    
    //     [self.navigationItem setLeftBarButtonItem: cancelItem];
    
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor blackColor];
    [lblTitle setFrame:CGRectMake(30, 80, 290, 20)];
    lblTitle.backgroundColor=[UIColor clearColor];
    lblTitle.textColor=[UIColor blackColor];
    lblTitle.userInteractionEnabled=NO;
    lblTitle.text= @"Welcome to `The Photo Schoppe`";
    [self.view addSubview:lblTitle];
    
    UILabel *lblUsername = [[UILabel alloc] init];
    lblUsername.textColor = [UIColor blackColor];
    [lblUsername setFrame:CGRectMake(40, 80+60, 90, 20)];
    lblUsername.backgroundColor=[UIColor clearColor];
    lblUsername.textColor=[UIColor blackColor];
    lblUsername.userInteractionEnabled=NO;
    lblUsername.text= @"Username";
    [self.view addSubview:lblUsername];
    
    textFieldUsername = [[UITextField  alloc] initWithFrame:CGRectMake(40+90+20, 80+60, 140, 25)];
    textFieldUsername.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldUsername setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:textFieldUsername];
    
    UILabel *lblPassword = [[UILabel alloc] init];
    lblPassword.textColor = [UIColor blackColor];
    [lblPassword setFrame:CGRectMake(40, 80+100, 90, 20)];
    lblPassword.backgroundColor=[UIColor clearColor];
    lblPassword.textColor=[UIColor blackColor];
    lblPassword.userInteractionEnabled=NO;
    lblPassword.text= @"Password";
    [self.view addSubview:lblPassword];
    
    textFieldPassword = [[UITextField  alloc] initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
    textFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldPassword setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:textFieldPassword];
    
    UIButton *btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRegister addTarget:self action:@selector(userRegTapped)
          forControlEvents:UIControlEventTouchUpInside];
    [btnRegister setTitle:@"Login" forState:UIControlStateNormal];
    btnRegister.frame = CGRectMake(60, 80+160, 100, 40);
    btnRegister.layer.borderWidth=1.0f;
    btnRegister.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnRegister];
    
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnClose addTarget:self action:@selector(cancelButtonPressed)
       forControlEvents:UIControlEventTouchUpInside];
    [btnClose setTitle:@"Close" forState:UIControlStateNormal];
    btnClose.frame = CGRectMake(60+100+20, 80+160, 100, 40);
    btnClose.layer.borderWidth=1.0f;
    btnClose.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnClose];
    
}

#pragma mark - private methods
- (void)userRegTapped {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *app_username = [prefs stringForKey:@"app_username"];
    NSString *app_password = [prefs stringForKey:@"app_password"];
    
    if([textFieldUsername.text isEqualToString: app_username] && [textFieldPassword.text isEqualToString: app_password]){
        NSLog(@"Correct login ..");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Welcome!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        MainMenuViewController *controller2 = [[MainMenuViewController alloc] init];
        [[self navigationController] pushViewController:controller2 animated:YES];
    }
    else{
        NSLog(@"Incorrect login ..");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Incorrect login" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
    
}

#pragma mark - alert view delegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        exit(0);
    }
    else if([title isEqualToString:@"Cancel"])
    {
        NSLog(@"No problem!");
    }
    
}

- (void)cancelButtonPressed {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Are you sure you want to exit?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: @"Cancel", nil] ;
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)doneButtonPressed {
    
    NewUserRegViewController *controller2 = [[NewUserRegViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
}

- (void)bypassButtonPressed {
    
    MainMenuViewController *controller2 = [[MainMenuViewController alloc] init];
    [[self navigationController] pushViewController:controller2 animated:YES];
}

@end
