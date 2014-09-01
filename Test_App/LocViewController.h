//
//  LocViewController.h
//  iOS-ThePhotoSchoppe
//
//  Created by Harsha Siriwardena on 8/28/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface LocViewController : UIViewController <GMSMapViewDelegate>
@property(nonatomic,retain) NSMutableArray *photos_list_array;

@end
