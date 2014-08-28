//
//  AppDelegate.h
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow                    *_window;
    SwitchTabBarController      *_switchTabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SwitchTabBarController *switchTabBarController;

@end
