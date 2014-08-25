//
//  APPViewController.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PhotoDownloader.h"

@interface APPViewController : UIViewController <UIPageViewControllerDataSource, NSURLConnectionDelegate>

@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableArray *images_list_array;

@end
