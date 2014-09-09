#import "DirectoryDataDownloader.h"

@implementation DirectoryDataDownloader
@synthesize array_of_image_filenames, spinner, internetReachableFoo;
@synthesize value, dic, photographer_array;

-(void)startDirectoryDownloadProcess{
    
    NSLog(@"Downloading data ..");
    [self testInternetConnection];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
    dispatch_async(downloadQueue, ^{
        
        NSURL *url=[[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/harshadura/iOS-ThePhotoSchoppe/master/Test_App/directory.xml"];
        // Write your file path here
        NSXMLParser *XML=[[NSXMLParser alloc] initWithContentsOfURL:url];
        XML.delegate=self;
        [XML parse];
        value=nil;
    });
}

- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Yayyy, we have the interwebs!");
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
            UIAlertView *errorView;
            errorView = [[UIAlertView alloc]
                         initWithTitle: NSLocalizedString(@"Network error", @"Network error")
                         message: NSLocalizedString(@"No internet connection found, this application requires an internet connection to gather the data required.", @"Network error")
                         delegate: self
                         cancelButtonTitle: NSLocalizedString(@"Close", @"Network error") otherButtonTitles: nil];
            
            [errorView show];
        });
    };
    
    [internetReachableFoo startNotifier];
}


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
    
    [_delegate directoryDownloadProcessCompleted];
}

-(void)dealloc
{
    // set the delegate to nil
    _delegate = nil;
}

@end