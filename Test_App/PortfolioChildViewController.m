//
//  APPChildViewController.m
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PortfolioChildViewController.h"

@interface PortfolioChildViewController ()

@end

@implementation PortfolioChildViewController
@synthesize btnShare, tapTwice, btnRate, pngPath, fullscreenImageView, prevFrame, isTappFirstTime, lblOveralRating, textOveralRating, rateView, statusLabel, textUserRating, imageView;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


- (void)tapOnce:(UIGestureRecognizer *)gesture
{
    //on a single  tap, call zoomToRect in UIScrollView
    //    [self.imageView zoomToRect:rectToZoomInTo animated:NO];
    //    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    //    [self.navigationController.tabBarController.tabBar setHidden:true];
    
    //    [[self navigationController] setHidesBottomBarWhenPushed:YES];
    
    //    [self hideTabBar: self.tabBarController];
    //    imageView.frame=CGRectMake(0,0,320,480);
    
    
    prevFrame = imageView.frame;
    
    //    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject: imageView];
    //    fullscreenImageView = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    
    fullscreenImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, 320, 460)]; //initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
    fullscreenImageView.image = [UIImage imageWithContentsOfFile: pngPath];
    [fullscreenImageView setFrame:[[UIScreen mainScreen] bounds]];
    [fullscreenImageView setUserInteractionEnabled:YES];
    
    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    //    [mainWindow addSubview: fullscreenImageView];
    
    [UIView transitionWithView:mainWindow duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve //change to whatever animation you like
                    animations:^ { [mainWindow addSubview:fullscreenImageView]; }
                    completion:nil];
    
    [self.fullscreenImageView addGestureRecognizer:tapTwice];
    
    
}
- (void)tapTwice:(UIGestureRecognizer *)gesture
{
    //on a double tap, call zoomToRect in UIScrollView
    //    [self.imageView zoomToRect:rectToZoomOutTo animated:NO];
    //      imageView.frame=CGRectMake(0,0,320,480);
    //    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //    [self showTabBar: self.tabBarController];
    //    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, 320, 460)];
    
    //    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    //    [mainWindow addSubview: imageView];
    
    
    [UIView animateWithDuration:0.5
                     animations:^{fullscreenImageView.alpha = 0.0;}
                     completion:^(BOOL finished){ [fullscreenImageView removeFromSuperview]; }];
    
    //    [fullscreenImageView removeFromSuperview];
}

- (void) hideTabBar:(UITabBarController *) tabbarcontroller
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    float fHeight = screenRect.size.height;
    if(  UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) )
    {
        fHeight = screenRect.size.width;
    }
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, fHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, fHeight)];
            view.backgroundColor = [UIColor blackColor];
        }
    }
    [UIView commitAnimations];
}



- (void) showTabBar:(UITabBarController *) tabbarcontroller
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    float fHeight = screenRect.size.height - tabbarcontroller.tabBar.frame.size.height;
    
    if(  UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) )
    {
        fHeight = screenRect.size.width - tabbarcontroller.tabBar.frame.size.height;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, fHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, fHeight)];
        }
    }
    [UIView commitAnimations];
}

- (void)viewDidLoad {
    
    
    UITapGestureRecognizer *tapOnce =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapOnce:)];
    tapTwice =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapTwice:)];
    
    tapOnce.numberOfTapsRequired = 2;
    tapTwice.numberOfTapsRequired = 1;
    
    //stops tapOnce from overriding tapTwice
    [tapOnce requireGestureRecognizerToFail:tapTwice];
    
    // then need to add the gesture recogniser to a view
    // - this will be the view that recognises the gesture
    [self.imageView addGestureRecognizer:tapOnce];
    //    [self.fullscreenImageView addGestureRecognizer:tapTwice];
    
    ///
    
    [self getOverallRatingByImageID: [NSString stringWithFormat:@"%d", self.index+1]];
    [self getIndividualRatingByUserId: @"1" AndImageID: @"1"];
    
    self.rateView.notSelectedImage = [UIImage imageNamed:@"kermit_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"kermit_full.png"];
    self.rateView.rating = 0;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    isTappFirstTime = NO;
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
}

- (void)viewDidUnload
{
    [self setRateView:nil];
    [self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)getOverallRatingByImageID: (NSString*) imgId
{
    //    http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=1&user_id=67&rating=245&flag=UPDATE_RATING
    
    NSString *strURL=[NSString stringWithFormat:@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=%@&flag=GET_AVG_RATING", imgId];
    NSURL *url = [NSURL URLWithString:strURL];
    
    //    NSURL *url = [NSURL URLWithString:[@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=&flag=GET_AVG_RATING"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:NULL];
             textOveralRating = [[NSString alloc] init];
             textOveralRating = [responseJson valueForKey:@"avg_rating"];
             
             NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
             
             [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
             
             [formatter setMaximumFractionDigits:2];
             
             [formatter setRoundingMode: NSNumberFormatterRoundUp];
             
             textOveralRating= [formatter stringFromNumber:[NSNumber numberWithFloat:[textOveralRating doubleValue]]];
             
             NSLog(@" -- %@", textOveralRating);
             lblOveralRating.text= [NSString stringWithFormat:@"Overall Rating: %@", textOveralRating];
             // [@"Overall Rating: %@", textOveralRating];
         }
     }];
}


- (void) getIndividualRatingByUserId: (NSString*) userId AndImageID: (NSString*) imageId
{
    //    http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=1&user_id=67&rating=245&flag=UPDATE_RATING
    
    NSString *strURL=[NSString stringWithFormat:@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=%@&user_id=%@&flag=GET_RATING", imageId, userId];
    NSURL *url = [NSURL URLWithString:strURL];
    
    //    NSURL *url = [NSURL URLWithString:[@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=&flag=GET_AVG_RATING"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:NULL];
             textUserRating = [[NSString alloc] init];
             textUserRating = [responseJson valueForKey:@"existing_rating"];
             
             NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
             
             [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
             
             [formatter setMaximumFractionDigits:2];
             
             [formatter setRoundingMode: NSNumberFormatterRoundUp];
             
             textUserRating = [formatter stringFromNumber:[NSNumber numberWithFloat:[textUserRating doubleValue]]];
             
             NSLog(@" -- %@", textUserRating);
             //             lblOveralRating.text= [NSString stringWithFormat:@"existing_rating: %@", textUserRating];
             float value = [formatter numberFromString:textUserRating].floatValue;
             [rateView setRating:value];
             
             // [@"Overall Rating: %@", textOveralRating];
         }
     }];
}



- (void) updateIndividualRatingByUserId: (NSString*) userId AndImageID: (NSString*) imageId AndRating: (NSString*) rating
{
    //    http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=1&user_id=67&rating=245&flag=UPDATE_RATING
    
    NSString *strURL=[NSString stringWithFormat:@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=%@&user_id=%@&rating=%@&flag=UPDATE_RATING", imageId, userId, rating];
    NSURL *url = [NSURL URLWithString:strURL];
    
    //    NSURL *url = [NSURL URLWithString:[@"http://thephotoschoppe-harshasiot.rhcloud.com/rate_webservice.php?image_id=&flag=GET_AVG_RATING"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:NULL];
             textUserRating = [[NSString alloc] init];
             textUserRating = [responseJson valueForKey:@"existing_rating"];
             
             NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
             
             [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
             
             [formatter setMaximumFractionDigits:2];
             
             [formatter setRoundingMode: NSNumberFormatterRoundUp];
             
             textUserRating = [formatter stringFromNumber:[NSNumber numberWithFloat:[textUserRating doubleValue]]];
             
             NSLog(@" -- %@", textUserRating);
             //             lblOveralRating.text= [NSString stringWithFormat:@"existing_rating: %@", textUserRating];
             //             float value = [formatter numberFromString:textUserRating].floatValue;
             //             [rateView setRating:value];
             
             // [@"Overall Rating: %@", textOveralRating];
         }
     }];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

//- (void)scrlTapREcotTap:(UITapGestureRecognizer *)gestureRecognizer
//{
//    if(isTappFirstTime)
//    {
//        //put code of hide
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            btnShare.alpha = 0;
//            btnRate.alpha = 0;
//            //            imgView.alpha = 0;
//        } completion: ^(BOOL finished) {
//            btnRate.hidden = YES;
//            btnShare.hidden = YES;
//            //            imgView.hidden = YES;
//        }];
//        isTappFirstTime = NO;
//    }
//    else
//    {
//        // put code of show
//        [UIView animateWithDuration:1.0 animations:^{
//            btnShare.alpha = 1;
//            btnRate.alpha = 1;
//            //            imgView.alpha = 1;
//        } completion: ^(BOOL finished) {
//            btnRate.hidden = NO;
//            btnShare.hidden = NO;
//            //            imgView.hidden = NO;
//        }];
//        isTappFirstTime = YES;
//    }
//}

- (void) loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    self.view = mainView;
    
    NSMutableArray *images_list_array = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"images_list"] mutableCopy];
    
    NSLog (@"Image >>  %i = %@", self.index, [images_list_array objectAtIndex: self.index]);
    
    NSString *Dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    pngPath = [NSString stringWithFormat:@"%@",[images_list_array objectAtIndex: self.index]];
    
    //NSString *pngPath = [NSString stringWithFormat:@"%@/test1234.png",Dir];// this path if you want save reference path in sqlite
    // this path if you want save reference path in sqlite
    
    NSLog (@"Image >>  %i = %@", self.index, pngPath);
    
    //NSString *pngPath = [NSString stringWithFormat:@"%@/%@",Dir, theFileName];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, 320, 460)]; //initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
    imageView.image = [UIImage imageWithContentsOfFile: pngPath];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    
    //    UIButton *btnDetail = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
    //    btnDetail.frame = CGRectMake(0,0,100,100);
    //    [btnDetail addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventAllTouchEvents];
    
    
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
    
//    UITapGestureRecognizer *scrlTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrlTapREcotTap:)];
//    [scrlTap setNumberOfTapsRequired:1];
//    [self.view addGestureRecognizer:scrlTap];
    
    //    btnShare = [UIButton buttonWithType: UIButtonTypeCustom];
    //    [btnShare setBackgroundColor: [UIColor clearColor]];
    //    [btnShare setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    //
    //    [btnShare setBackgroundImage:greenbuttonImage forState:UIControlStateNormal];
    //    [btnShare setBackgroundImage:greenbuttonImageHighlight forState:UIControlStateHighlighted];
    //
    //    [btnShare addTarget:self action:@selector(doneButtonPressed)  forControlEvents:UIControlEventTouchUpInside];
    //    [btnShare setTitle:@"Share" forState:UIControlStateNormal];
    //    btnShare.frame = CGRectMake(10, 400, 100, 40);
    //    [self.view addSubview:btnShare];
    //
    //    [imageView addSubview:btnShare];
    //    [imageView bringSubviewToFront:btnShare];
    //    [imageView setUserInteractionEnabled:YES];
    //
    //    //
    //
    //    btnRate = [UIButton buttonWithType: UIButtonTypeCustom];
    //    [btnRate setBackgroundColor: [UIColor clearColor]];
    //    [btnRate setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    //
    //    [btnRate setBackgroundImage:orangebuttonImage forState:UIControlStateNormal];
    //    [btnRate setBackgroundImage:orangebuttonImageHighlight forState:UIControlStateHighlighted];
    //
    //    [btnRate addTarget:self action:@selector(doneButtonPressed)  forControlEvents:UIControlEventTouchUpInside];
    //    [btnRate setTitle:@"Rate" forState:UIControlStateNormal];
    //    btnRate.frame = CGRectMake(210, 400, 100, 40);
    //    [self.view addSubview:btnRate];
    
    
    
    
    //    lblOveralRating = [[UILabel alloc] init];
    //    lblOveralRating.textColor = [UIColor redColor];
    //    [lblOveralRating setFrame:CGRectMake(10+100+20, 470, 250, 40)];
    //    lblOveralRating.backgroundColor=[UIColor clearColor];
    //    lblOveralRating.userInteractionEnabled=NO;
    //    lblOveralRating.text= textOveralRating;
    //    [self.view addSubview:lblOveralRating];
    
    [imageView addSubview:btnRate];
    [imageView bringSubviewToFront:btnRate];
    [imageView setUserInteractionEnabled:YES];
    
    btnRate.hidden = YES;
    btnShare.hidden = YES;
    //    lblOveralRating.hidden = YES;
    
    rateView = [[RateView alloc] init];
    [rateView setFrame:CGRectMake(10+100+20, 360, 100, 60)];
    //    rateView.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rateView];
    [imageView addSubview:rateView];
    [imageView bringSubviewToFront:rateView];
    [imageView setUserInteractionEnabled:YES];
    
    statusLabel = [[UILabel alloc] init];
    statusLabel.textColor = [UIColor redColor];
    [statusLabel setFrame:CGRectMake(10+100+20, 340, 250, 40)];
    statusLabel.backgroundColor=[UIColor clearColor];
    statusLabel.userInteractionEnabled=NO;
    //    [self.view addSubview:statusLabel];
    [imageView addSubview:statusLabel];
    [imageView bringSubviewToFront:statusLabel];
    [imageView setUserInteractionEnabled:YES];
    
    
    CGFloat labelX = rateView.bounds.size.width + 2;
    
    lblOveralRating = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 180, self.imageView.bounds.size.width - (labelX + 2), self.imageView.frame.size.height)];
    lblOveralRating.textColor = [UIColor redColor];
    lblOveralRating.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    lblOveralRating.font = [UIFont boldSystemFontOfSize:12.0f];
    lblOveralRating.numberOfLines = 1;
    lblOveralRating.backgroundColor = [UIColor clearColor];
    lblOveralRating.userInteractionEnabled=NO;
    lblOveralRating.text= textOveralRating;
    [imageView addSubview:lblOveralRating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    //    (void) updateIndividualRatingByUserId: (NSString*) userId AndImageID: (NSString*) imageId AndRating:
    [self updateIndividualRatingByUserId: @"1" AndImageID: [NSString stringWithFormat:@"%d", self.index+1]  AndRating:[NSString stringWithFormat:@"%f", rating]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *user_rate= [formatter stringFromNumber:[NSNumber numberWithFloat:rating]];
    //    self.statusLabel.text = [NSString stringWithFormat:@"User Rating: %@", user_rate];
}

@end
