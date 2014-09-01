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
    
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.textColor = [UIColor blackColor];
    [lblTitle setFrame:CGRectMake(30, 50, 290, 20)];
    lblTitle.backgroundColor=[UIColor clearColor];
    lblTitle.textColor=[UIColor blackColor];
    lblTitle.userInteractionEnabled=NO;
    lblTitle.text= @"New user registration";
    [self.view addSubview:lblTitle];
    
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
    
    
    UIImage *bluebuttonImage = [[UIImage imageNamed:@"blueButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *bluebuttonImageHighlight = [[UIImage imageNamed:@"blueButtonHighlight.png"]
                                         resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *greenbuttonImage = [[UIImage imageNamed:@"greenButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *greenbuttonImageHighlight = [[UIImage imageNamed:@"greenButtonHighlight.png"]
                                          resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    UIImage *orangebuttonImage = [[UIImage imageNamed:@"orangeButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *orangebuttonImageHighlight = [[UIImage imageNamed:@"orangeButtonHighlight.png"]
                                           resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    UIImage *tanbuttonImage = [[UIImage imageNamed:@"tanButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *tanbuttonImageHighlight = [[UIImage imageNamed:@"tanButtonHighlight.png"]
                                        resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    UIImage *greybuttonImage = [[UIImage imageNamed:@"greyButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *greybuttonImageHighlight = [[UIImage imageNamed:@"greyButtonHighlight.png"]
                                         resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
//    UIButton *btnRegister = [UIButton buttonWithType: UIButtonTypeCustom];
//    [btnRegister setBackgroundColor: [UIColor whiteColor]];
//    [btnRegister setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
//    
//    [btnRegister addTarget:self action:@selector(userRegTapped) forControlEvents:UIControlEventTouchUpInside];
//    [btnRegister setTitle:@"SignIn" forState:UIControlStateNormal];
//    
//    // Set the background for any states you plan to use
//    btnRegister.frame = CGRectMake(60, 80+160, 100, 40);
//    [btnRegister setBackgroundImage:bluebuttonImage forState:UIControlStateNormal];
//    [btnRegister setBackgroundImage:bluebuttonImageHighlight forState:UIControlStateHighlighted];
//    [self.view addSubview:btnRegister];

    UIButton *btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRegister addTarget:self action:@selector(userRegTapped) forControlEvents:UIControlEventTouchUpInside];
    [btnRegister setBackgroundColor: [UIColor whiteColor]];
    [btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    [btnRegister setTitleColor:[UIColor whiteColor] forState: UIControlStateHighlighted];
    
    [btnRegister setBackgroundImage:greenbuttonImage forState:UIControlStateNormal];
    [btnRegister setBackgroundImage:greenbuttonImageHighlight forState:UIControlStateHighlighted];
    
    btnRegister.frame = CGRectMake(60, 40+200, 100, 40);
    [self.view addSubview:btnRegister];
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnClose addTarget:self action:@selector(gobackTapped) forControlEvents:UIControlEventTouchUpInside];
    [btnClose setBackgroundColor: [UIColor whiteColor]];
    [btnClose setTitle:@"Back" forState:UIControlStateNormal];
    [btnClose setTitleColor:[UIColor whiteColor] forState: UIControlStateHighlighted];
    
    [btnClose setBackgroundImage:greybuttonImage forState:UIControlStateNormal];
    [btnClose setBackgroundImage:greybuttonImageHighlight forState:UIControlStateHighlighted];
    
    btnClose.frame = CGRectMake(60+100+20, 40+200, 100, 40);
    [self.view addSubview:btnClose];
    
    
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

- (void)gobackTapped {
//    LoginViewController *controller2 = [[LoginViewController alloc] init];
//    [self presentModalViewController:controller2 animated:NO];

    [self dismissModalViewControllerAnimated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
