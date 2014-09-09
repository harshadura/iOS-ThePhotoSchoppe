#import "PhotoDownloader.h"

@implementation PhotoDownloader
@synthesize value, dic, book_array, array_of_image_filenames, spinner, internetReachableFoo;

-(void)startPhotoDownloadProcess{
    
    NSLog(@"Downloading data ..");
    [self testInternetConnection];
    
    array_of_image_filenames = [[NSMutableArray alloc]init];
    dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
    dispatch_async(downloadQueue, ^{
        
        NSURL *url=[[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/harshadura/iOS-ThePhotoSchoppe/master/Test_App/photos.xml"];
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
    NSUInteger elements = [book_array count];
    for (int i=0 ; i<elements ; i++){
        
        //    for (int i=0 ; i<=2 ; i++){
        NSMutableDictionary *temp=[book_array objectAtIndex:i];
        NSLog(@"**************");
        NSLog(@" Image id %@",[temp valueForKey:@"id"]);
        NSLog(@" Image name %@",[temp valueForKey:@"name"]);
        NSLog(@" Image url %@",[temp valueForKey:@"image_url"]);
        NSLog(@" Image location %@",[temp valueForKey:@"location"]);
        NSLog(@" Image last update %@",[temp valueForKey:@"last_update"]);
        NSLog(@" Image publisher %@",[temp valueForKey:@"publisher"]);
        
        [self save_image:[temp valueForKey:@"image_url"]];
        
        NSLog(@"User Data saved");
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array_of_image_filenames forKey:@"images_list"];
    [defaults setObject:book_array forKey:@"photos_list"];
    [defaults synchronize];
    
    [_delegate photoDownloadProcessCompleted];
    
}

-(void) save_image:(NSString*)path
{
    
    NSString *trimmed = [path stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    trimmed=[trimmed stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    // Get an image from the URL below**
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:trimmed]]];
    
    NSLog(@"%f,%f",image.size.width,image.size.height);
    
    // Let's save the file into Document folder.**
    
    NSString* theFileName = [trimmed lastPathComponent];
    NSString *Dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *pngPath = [NSString stringWithFormat:@"%@/%@",Dir, theFileName];// this path if you want save reference path in sqlite
    
    NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data1 writeToFile:pngPath atomically:YES];
    NSLog(@">>> saving png");
    NSLog(@"%@",pngPath);
    [array_of_image_filenames addObject:pngPath];
    
}

-(void)dealloc
{
    // set the delegate to nil
    _delegate = nil;
}

@end