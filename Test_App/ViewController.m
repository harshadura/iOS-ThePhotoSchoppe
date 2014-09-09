#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (id)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    PhotoDownloader *sampleProtocol = [[PhotoDownloader alloc]init];
    sampleProtocol.delegate = self;
    [myLabel setText:@"Processing..."];
    [sampleProtocol startPhotoDownloadProcess];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Sample protocol delegate
-(void)photoDownloadProcessCompleted{
    [myLabel setText:@"Process Completed"];
}

- (void) loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    self.view = mainView;
    
    myLabel = [[UILabel alloc] init];
    myLabel.textColor = [UIColor blackColor];
    [myLabel setFrame:CGRectMake(40, 50+20, 300, 20)];
    myLabel.backgroundColor=[UIColor clearColor];
    myLabel.textColor=[UIColor blackColor];
    myLabel.userInteractionEnabled=NO;
    myLabel.text= @"";
    [self.view addSubview:myLabel];
}

@end