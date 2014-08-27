//
//  ViewController.h
//  Test_App
//
//  Created by Harsha Siriwardena on 8/18/14. 333
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoDownloader.h"

@interface MainMenuViewController : UIViewController <PhotoDownloaderDelegate>

@property(nonatomic,retain) UIActivityIndicatorView *activityIndicator;

@end
