//
//  XMLWebImagesViewController.h
//  iOS-ThePhotoSchoppe
//
//  Created by Harsha Siriwardena on 8/21/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface XMLWebImagesViewController: UIViewController

@property(nonatomic,retain)NSMutableDictionary *dic;
@property(nonatomic,retain)NSMutableString *value;
@property(nonatomic,retain)NSMutableArray *book_array;

-(void)print_array;

@end