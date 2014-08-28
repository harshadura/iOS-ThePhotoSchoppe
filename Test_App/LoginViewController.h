//
//  ViewController.h
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginViewController;

@protocol LoginViewControllerDelegate
-(void)loginViewControllerDidFinish:(LoginViewController *)loginViewController;
@end

@interface LoginViewController : UIViewController

@property (nonatomic,assign) id delegate;
@property(nonatomic,retain) UITextField *textFieldUsername;
@property(nonatomic,retain) UITextField *textFieldPassword;

@end
