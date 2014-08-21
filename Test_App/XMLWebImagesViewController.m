//
//  XMLWebImagesViewController.m
//  iOS-ThePhotoSchoppe
//
//  Created by Harsha Siriwardena on 8/21/14.
//  Copyright (c) 2014 Harsha. All rights reserved.
//

#import "XMLWebImagesViewController.h"

@interface XMLWebImagesViewController ()

@end

@implementation XMLWebImagesViewController
@synthesize value, dic, book_array;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];// Do any additional setup after loading the view from its nib.
    NSURL *url=[[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/harshadura/iOS-ThePhotoSchoppe/master/Test_App/photos.xml"]; // Write your file path here
    NSXMLParser *XML=[[NSXMLParser alloc] initWithContentsOfURL:url];
    XML.delegate=self;
    [XML parse];
    value=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"photos" ]) {
        // Initialize book_array to store xml file values
        book_array=[[NSMutableArray alloc]init];
    }
    else
    {
        if([elementName isEqualToString:@"photo"]){
            // Initialize Dictionary to store a file information
            // Store Book id Value
            dic=[[NSMutableDictionary alloc]init];
            NSString *temp=[ attributeDict valueForKey:@"id"];
            [dic setValue:value forKey:@"id"];
        }
        value=nil;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(!value){
        value=[[NSMutableString alloc]init];
    }
    [value appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"photos"]){ // All XML file information is parse to book array // Now you can call a function in which you can use this array as you want.
        [self print_array];
    }
    else if([elementName isEqualToString:@"photo"]) { // Add book dictionary to book array
        [book_array addObject:dic];
        dic=nil;
    }
    else if([elementName isEqualToString:@"name"]) { // add book author in book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"title"]) { // add book title to book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"image_url"]) { // add book price to book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"location"]) { // add book publish date to book dictionary [dic setValue:value forKey:elementName];
         [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"last_update"]) { // add book publish date to book dictionary [dic setValue:value forKey:elementName];
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"publisher"]) { // add book description to book dictionary
        [dic setValue:value forKey:elementName];
    }
}

-(void)print_array
{
    for (int i=0 ; i<=2 ; i++){
        NSMutableDictionary *temp=[book_array objectAtIndex:i];
        NSLog(@"**************");
        NSLog(@" Image id %@",[temp valueForKey:@"id"]);
        NSLog(@" Image name %@",[temp valueForKey:@"name"]);
        NSLog(@" Image url %@",[temp valueForKey:@"image_url"]);
        NSLog(@" Image location %@",[temp valueForKey:@"location"]);
        NSLog(@" Image last update %@",[temp valueForKey:@"last_update"]);
        NSLog(@" Image publisher %@",[temp valueForKey:@"publisher"]);

        [self save_image:[temp valueForKey:@"image_url"]];
        
        
    }
}

-(void)save_image:(NSString*)path
{
    NSString *trimmed = [path stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    trimmed=[trimmed stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    // Get an image from the URL below**
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:trimmed]]];
    
    NSLog(@"%f,%f",image.size.width,image.size.height);
    
    // Let's save the file into Document folder.**
    
    NSString *Dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *pngPath = [NSString stringWithFormat:@"%@/test1234.png",Dir];// this path if you want save reference path in sqlite
    NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data1 writeToFile:pngPath atomically:YES];
    NSLog(@">>> saving png");
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]; //initWithFrame:CGRectMake(40+100+10, 80+100, 140, 25)];
    imageView.image = [UIImage imageWithContentsOfFile: pngPath];
    [self.view addSubview:imageView];
    
//    NSString *jpegPath = [NSString stringWithFormat:@"%@/test.jpeg",Dir];// this path if you want save reference path in sqlite
//    NSData *data2 = [NSData dataWithData:UIImageJPEGRepresentation(image, 1.0f)];//1.0f = 100% quality
//    [data2 writeToFile:jpegFilePath atomically:YES];
//    NSLog(@"saving image done");
    
 //   [image release];
}

@end
