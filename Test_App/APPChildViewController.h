//
//  APPChildViewController.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface APPChildViewController : UIViewController <RateViewDelegate>

@property (strong, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (nonatomic)  BOOL *isTappFirstTime;
@property (strong, nonatomic) UIButton *btnRate;
@property (strong, nonatomic) UIButton *btnShare;
@property (strong, nonatomic) UILabel *lblOveralRating;
@property (strong, nonatomic) NSString *textOveralRating;
@property (strong, nonatomic) NSString *textUserRating;
@property (strong, nonatomic) UIImageView *imageView;
@end
