//
//  TablieViewController.m
//  TableViewProg
//
//  Created by Dan on 15/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TablieViewController.h"
#import "CustomCell.h"

@interface TablieViewController ()

@end

@implementation TablieViewController {
    UITableView *tableView;
}

@synthesize value, dic, photographer_array;

- (void)viewDidLoad
{
    [super viewDidLoad];
//     photographer_array = [[NSMutableArray alloc]init];
    
    NSURL *url=[[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/harshadura/iOS-ThePhotoSchoppe/master/Test_App/directory.xml"];
    // Write your file path here
    NSXMLParser *XML=[[NSXMLParser alloc] initWithContentsOfURL:url];
    XML.delegate=self;
    [XML parse];
    value=nil;
    
    // init table view
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //    tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    [self.view addSubview:tableView];
    
    

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        //        cell = [[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault
        //                                       reuseIdentifier:CellIdentifier] autorelease];
        
        
        cell = [[[CustomCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    ////////
//    photographer_array
    NSMutableDictionary *data_dic = [photographer_array objectAtIndex:indexPath.row];
    
    NSString *fname = [data_dic objectForKey:@"fname"];
    NSString *lname = [data_dic objectForKey:@"lname"];
    NSString *phone = [data_dic objectForKey:@"phone"];
    NSString *email_pub_id = [data_dic objectForKey:@"email_pub_id"];
    
    fname = [fname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    fname=[fname stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    lname = [lname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    lname=[lname stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    phone = [phone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    phone=[phone stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    email_pub_id = [email_pub_id stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    email_pub_id=[email_pub_id stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSString *full_name = [NSString stringWithFormat:@"%@ %@", fname, lname];
    NSString *contact_info = [NSString stringWithFormat:@"%@ | %@", phone, email_pub_id];
    
    cell.primaryLabel.text = full_name;
    cell.secondaryLabel.text = contact_info;
    cell.myImageView.image = nil;
    
//    // Set up the cell…
//    switch (indexPath.row) {
//        case 0:
//            cell.primaryLabel.text = @"Meeting on iPhone Development";
//            cell.secondaryLabel.text = @"Sat 10:30";
//            cell.myImageView.image = [UIImage imageNamed:@"meeting_color.png"];
//            break;
//        case 1:
//            cell.primaryLabel.text = @"Call With Client";
//            cell.secondaryLabel.text = @"Planned";
//            cell.myImageView.image = [UIImage imageNamed:@"call_color.png"];
//            break;
//        case 2:
//            cell.primaryLabel.text = @"Appointment with Joey";
//            cell.secondaryLabel.text = @"2 Hours";
//            cell.myImageView.image = [UIImage imageNamed:@"calendar_color.png"];
//            break;
//        case 3:
//            cell.primaryLabel.text = @"Call With Client";
//            cell.secondaryLabel.text = @"Planned";
//            cell.myImageView.image = [UIImage imageNamed:@"call_color.png"];
//            break;
//        case 4:
//            cell.primaryLabel.text = @"Appointment with Joey";
//            cell.secondaryLabel.text = @"2 Hours";
//            cell.myImageView.image = [UIImage imageNamed:@"calendar_color.png"];
//            break;
//        default:
//            break;
//    }
    
    return cell;
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//// number of row in the section, I assume there is only 1 row
//- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1;
//}
//
//// the cell will be returned to the tableView
//- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellIdentifier = @"HistoryCell";
//
//    // Similar to UITableViewCell, but
//    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    // Just want to test, so I hardcode the data
//    cell.descriptionLabel.text = @"Testing";
//
//    return cell;
//}
//
//#pragma mark - UITableViewDelegate
//// when user tap the row, what action you want to perform
//- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"selected %d row", indexPath.row);
//}



-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"directory" ]) {
        // Initialize photographer_array to store xml file values
        photographer_array=[[NSMutableArray alloc]init];
    }
    else
    {
        if([elementName isEqualToString:@"photographer"]){
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
    if([elementName isEqualToString:@"directory"]){ // All XML file information is parse to book array // Now you can call a function in which you can use this array as you want.
        [self print_array];
    }
    else if([elementName isEqualToString:@"photographer"]) { // Add book dictionary to book array
        [photographer_array addObject:dic];
        dic=nil;
    }
    else if([elementName isEqualToString:@"fname"]) { // add book author in book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"lname"]) { // add book title to book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"email_pub_id"]) { // add book price to book dictionary
        [dic setValue:value forKey:elementName];
    }
    else if([elementName isEqualToString:@"phone"]) { // add book publish date to book dictionary [dic setValue:value forKey:elementName];
        [dic setValue:value forKey:elementName];
    }
}

-(void)print_array
{
    NSUInteger elements = [photographer_array count];
    for (int i=0 ; i<elements ; i++){
        NSMutableDictionary *temp=[photographer_array objectAtIndex:i];
        NSLog(@"**************");
        NSLog(@" id %@",[temp valueForKey:@"id"]);
        NSLog(@" fname %@",[temp valueForKey:@"fname"]);
        NSLog(@" lname %@",[temp valueForKey:@"lname"]);
        NSLog(@" phone %@",[temp valueForKey:@"phone"]);
        NSLog(@" email_pub_id %@",[temp valueForKey:@"email_pub_id"]);
        NSLog(@"Data saved");
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:photographer_array forKey:@"directory_list"];
    [defaults synchronize];
}

@end