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
    
    UILabel *lblAddress = [[UILabel alloc] init];
    //    [lblAddress sizeToFit];
    lblAddress.textColor = [UIColor blackColor];
    [lblAddress setFrame:CGRectMake(40, 50+40, 300, 100)];
    lblAddress.backgroundColor=[UIColor clearColor];
    lblAddress.textColor=[UIColor blackColor];
    lblAddress.userInteractionEnabled=NO;
    //    lblAddress.numberOfLines = 2;
    lblAddress.lineBreakMode = NSLineBreakByWordWrapping;
    lblAddress.numberOfLines = 0;
    
    lblAddress.text= @"Address:\rNo.48, 5th Floor,\rIBM Building Navam Mawatha,\rColombo";
    [self.view addSubview:lblAddress];
    
    
    //    No.48, 5th Floor, IBM Building Navam Mawatha, Colombo
    //    011 2 300500
    
    
    UIButton *lblPhone = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lblPhone addTarget:self action:@selector(makeaPhoneCall)
       forControlEvents:UIControlEventTouchUpInside];
    [lblPhone setTitle:@"Phone: +94112300500" forState:UIControlStateNormal];
    lblPhone.frame = CGRectMake(40, 50+40+120, 300, 20);
    //    lblPhone.layer.borderWidth=1.0f;
    //    lblPhone.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:lblPhone];
    
    UIButton *lblEmail = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lblEmail addTarget:self action:@selector(EmailButtonActionWithSubject)
       forControlEvents:UIControlEventTouchUpInside];
    [lblEmail setTitle:@"Email: info@ironone.com" forState:UIControlStateNormal];
    lblEmail.frame = CGRectMake(40, 50+40+60+100, 300, 20);
    //    lblEmail.layer.borderWidth=1.0f;
    //    lblEmail.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.view addSubview:lblEmail];
    
    
    
    //    UILabel *lblPhone = [[UILabel alloc] init];
    //    lblPhone.textColor = [UIColor blackColor];
    //    [lblPhone setFrame:CGRectMake(40, 50+40+100, 300, 20)];
    //    lblPhone.backgroundColor=[UIColor clearColor];
    //    lblPhone.textColor=[UIColor blackColor];
    //    lblPhone.userInteractionEnabled=YES;
    //    lblPhone.text= @"Phone: +94112300500";
    //    [self.view addSubview:lblPhone];
    //
    //    UITapGestureRecognizer *tapGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(makeaPhoneCall)];
    //    [lblPhone addGestureRecognizer:tapGesture];
    //
    //    UILabel *lblEmail = [[UILabel alloc] init];
    //    lblEmail.textColor = [UIColor blackColor];
    //    [lblEmail setFrame:CGRectMake(40, 50+40+40+100, 300, 20)];
    //    lblEmail.backgroundColor=[UIColor clearColor];
    //    lblEmail.textColor=[UIColor blackColor];
    //    lblEmail.userInteractionEnabled=NO;
    //    lblEmail.text= @"Email: info@irontech.com";
    //    [self.view addSubview:lblEmail];
    
    //    Display the contact information (address, phone number and email address)
    
}

- (void) makeaPhoneCall{
    NSString *phNo = @"+94112300500";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
//- (void) doLoginWithUserId: (NSString *) userId andPassword : (NSString *) pwd;

//-(void)EmailButtonActionWithSubject: (NSString*)subject withToField :(NSString*)to { // -(void)fullName:(NSString*)fname :(NSString*)mname :(NSString*)lname
//:@"Inquiry for the Photo Schoppe" withToField:@"info@irontech.com"

-(void)EmailButtonActionWithSubject{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"Inquiry for the Photo Schoppe"];
        [controller setToRecipients:[NSArray arrayWithObjects:@"info@ironone.com",nil]];
        //        [controller setToRecipients:(NSArray *) @"info@irontech.com"];
        [controller setMessageBody:@"" isHTML:NO];
        
        if (controller) [self presentModalViewController:controller animated:YES];
        [controller release];
        
    } else {
        NSLog(@"feature not available to send email!");
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
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
