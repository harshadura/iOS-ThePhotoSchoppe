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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    photographer_array = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"directory_list"] mutableCopy];

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

@end