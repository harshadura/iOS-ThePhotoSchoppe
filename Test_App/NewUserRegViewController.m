//
//  ViewController.m
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "NewUserRegViewController.h"
#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NewUserRegViewController ()

@end

@implementation NewUserRegViewController

@synthesize textFieldUsername, textFieldPassword, textFieldEmail;

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
    
//    UINavigationBar *naviBarObj = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [self.view addSubview:naviBarObj];
//    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"         style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonPressed)];
////    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"New User?" style:UIBarButtonItemStyleBordered target:self
////                                                                action:@selector(doneButtonPressed)];
//    
//    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Navigation Title"];
////    navigItem.rightBarButtonItem = doneItem;
//    navigItem.leftBarButtonItem = cancelItem;
//    naviBarObj.items = [NSArray arrayWithObjects: navigItem,nil];
//    [self.view addSubview:naviBarObj];
//
    
    [self.navigationItem setTitle:@"New user registration"];
//    [self.navigationItem setLeftBarButtonItem: cancelItem];

    
//    UILabel *lblTitle = [[UILabel alloc] init];
//    /*important--------- */lblTitle.textColor = [UIColor blackColor];
//    [lblTitle setFrame:CGRectMake(80, 50+20, 200, 20)];
//    lblTitle.backgroundColor=[UIColor clearColor];
//    lblTitle.textColor=[UIColor blackColor];
//    lblTitle.userInteractionEnabled=NO;
//    lblTitle.text= @"New user registration";
//    [self.view addSubview:lblTitle];
    
    UILabel *lblUsername = [[UILabel alloc] init];
    lblUsername.textColor = [UIColor blackColor];
    [lblUsername setFrame:CGRectMake(40, 40+60, 90, 20)];
    lblUsername.backgroundColor=[UIColor clearColor];
    lblUsername.textColor=[UIColor blackColor];
    lblUsername.userInteractionEnabled=NO;
    lblUsername.text= @"Username";
    [self.view addSubview:lblUsername];

    textFieldUsername = [[UITextField  alloc] initWithFrame:CGRectMake(40+90+20, 40+60, 140, 25)];
    textFieldUsername.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldUsername setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:textFieldUsername];
    
    UILabel *lblPassword = [[UILabel alloc] init];
    lblPassword.textColor = [UIColor blackColor];
    [lblPassword setFrame:CGRectMake(40, 40+100, 90, 20)];
    lblPassword.backgroundColor=[UIColor clearColor];
    lblPassword.textColor=[UIColor blackColor];
    lblPassword.userInteractionEnabled=NO;
    lblPassword.text= @"Password";
    [self.view addSubview:lblPassword];
    
    textFieldPassword = [[UITextField  alloc] initWithFrame:CGRectMake(40+100+10, 40+100, 140, 25)];
    textFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldPassword setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:textFieldPassword];
    
    UILabel *lblEmail = [[UILabel alloc] init];
    lblEmail.textColor = [UIColor blackColor];
    [lblEmail setFrame:CGRectMake(40, 40+140, 90, 20)];
    lblEmail.backgroundColor=[UIColor clearColor];
    lblEmail.textColor=[UIColor blackColor];
    lblEmail.userInteractionEnabled=NO;
    lblEmail.text= @"Email";
    [self.view addSubview:lblEmail];
    
    textFieldEmail = [[UITextField  alloc] initWithFrame:CGRectMake(40+100+10, 40+140, 140, 25)];
    textFieldEmail.borderStyle = UITextBorderStyleRoundedRect;
    [textFieldEmail setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:textFieldEmail];
    
//    UIButton *btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnLogin setBackgroundColor:[UIColor blueColor]];
//    [btnLogin setFrame:CGRectMake(60, 180, 200, 44)];
//    [btnLogin addTarget:self action:@selector(testBtnTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnLogin];

    UIButton *btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRegister addTarget:self action:@selector(userRegTapped)
     forControlEvents:UIControlEventTouchUpInside];
    [btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    btnRegister.frame = CGRectMake(60, 40+200, 100, 40);
    btnRegister.layer.borderWidth=1.0f;
    btnRegister.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnRegister];

    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnClose addTarget:self action:@selector(userRegTapped)
     forControlEvents:UIControlEventTouchUpInside];
    [btnClose setTitle:@"Close" forState:UIControlStateNormal];
    btnClose.frame = CGRectMake(60+100+20, 40+200, 100, 40);
    btnClose.layer.borderWidth=1.0f;
    btnClose.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:btnClose];
    
    // Store the data

    
    
//    UIButton *btnTest2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnTest2 setBackgroundColor:[UIColor yellowColor]];
//    [btnTest2 setFrame:CGRectMake(0 + 200 + 10, 10, 50, 44)];
//    [self.view addSubview:btnTest2];
//    
//    UIButton *btnTest3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnTest3 setBackgroundColor:[UIColor greenColor]];
//    [btnTest3 setFrame:CGRectMake(0 + 200 + 10, 70, 50, 44)];
//    [self.view addSubview:btnTest3];
    
//    UILabel *lbl1 = [[UILabel alloc] init];
//    /*important--------- */lbl1.textColor = [UIColor blackColor];
//    [lbl1 setFrame:CGRectMake(0 + 200 + 10, 10, 100, 44)];
//    lbl1.backgroundColor=[UIColor clearColor];
//    lbl1.textColor=[UIColor blackColor];
//    lbl1.userInteractionEnabled=NO;
//    lbl1.text= @"TEST";
//    [self.view addSubview:lbl1];
    
    
}

- (void) userRegTapped {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:textFieldUsername.text forKey:@"app_username"];
    [defaults setObject:textFieldPassword.text forKey:@"app_password"];
    [defaults setObject:textFieldEmail.text forKey:@"email"];
    [defaults synchronize];
    NSLog(@"User Data saved");
    
    NSString *text123 = [NSString stringWithFormat:@"*** Data -- %@, %@, %@ ***", textFieldUsername.text, textFieldPassword.text, textFieldEmail.text];
    NSLog(@"%@", text123);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Thanks!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)cancelButtonPressed {
    exit(0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
