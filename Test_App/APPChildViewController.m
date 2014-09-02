//
//  APPChildViewController.m
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPChildViewController.h"

@interface APPChildViewController ()

@end

@implementation APPChildViewController
@synthesize btnShare, btnRate, isTappFirstTime;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    isTappFirstTime = NO;
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)scrlTapREcotTap:(UITapGestureRecognizer *)gestureRecognizer
{
    if(isTappFirstTime)
    {
        //put code of hide
        
        [UIView animateWithDuration:1.0 animations:^{
            btnShare.alpha = 0;
            btnRate.alpha = 0;
//            imgView.alpha = 0;
        } completion: ^(BOOL finished) {
            btnRate.hidden = YES;
            btnShare.hidden = YES;
//            imgView.hidden = YES;
        }];
        isTappFirstTime = NO;
    }
    else
    {
        // put code of show
        [UIView animateWithDuration:1.0 animations:^{
            btnShare.alpha = 1;
            btnRate.alpha = 1;
//            imgView.alpha = 1;
        } completion: ^(BOOL finished) {
            btnRate.hidden = NO;
            btnShare.hidden = NO;
//            imgView.hidden = NO;
        }];
        isTappFirstTime = YES;
    }
}

- (void) loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    self.view = mainView;
    
    NSMutableArray *images_list_array = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"images_list"] mutableCopy];
    
    NSLog (@"Image >>  %i = %@", self.index, [images_list_array objectAtIndex: self.index]);
    
    NSString *Dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *pngPath = [NSString stringWithFormat:@"%@",[images_list_array objectAtIndex: self.index]];
    
    //NSString *pngPath = [NSString stringWithFormat:@"%@/test1234.png",Dir];// this path if you want save reference path in sqlite
    // this path if you want save reference path in sqlite
    
    NSLog (@"Image >>  %i = %@", self.index, pngPath);
    
    //NSString *pngPath = [NSString stringWithFormat:@"%@/%@",Dir, theFileName];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, 320, 460)]; //initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
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
    
    UITapGestureRecognizer *scrlTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrlTapREcotTap:)];
    [scrlTap setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:scrlTap];
    
    btnShare = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnShare setBackgroundColor: [UIColor clearColor]];
    [btnShare setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    
    [btnShare setBackgroundImage:greenbuttonImage forState:UIControlStateNormal];
    [btnShare setBackgroundImage:greenbuttonImageHighlight forState:UIControlStateHighlighted];
    
    [btnShare addTarget:self action:@selector(doneButtonPressed)  forControlEvents:UIControlEventTouchUpInside];
    [btnShare setTitle:@"Share" forState:UIControlStateNormal];
    btnShare.frame = CGRectMake(10, 400, 100, 40);
    [self.view addSubview:btnShare];
    
    [imageView addSubview:btnShare];
    [imageView bringSubviewToFront:btnShare];
    [imageView setUserInteractionEnabled:YES];
    
    //
    
    btnRate = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnRate setBackgroundColor: [UIColor clearColor]];
    [btnRate setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    
    [btnRate setBackgroundImage:orangebuttonImage forState:UIControlStateNormal];
    [btnRate setBackgroundImage:orangebuttonImageHighlight forState:UIControlStateHighlighted];
    
    [btnRate addTarget:self action:@selector(doneButtonPressed)  forControlEvents:UIControlEventTouchUpInside];
    [btnRate setTitle:@"Rate" forState:UIControlStateNormal];
    btnRate.frame = CGRectMake(210, 400, 100, 40);
    [self.view addSubview:btnRate];
    
    [imageView addSubview:btnRate];
    [imageView bringSubviewToFront:btnRate];
    [imageView setUserInteractionEnabled:YES];
    
    btnRate.hidden = YES;
    btnShare.hidden = YES;
}

@end
