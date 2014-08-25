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

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 46, 320, 480)]; //initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
    imageView.image = [UIImage imageWithContentsOfFile: pngPath];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
}

@end
