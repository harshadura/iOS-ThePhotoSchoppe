#import <Foundation/Foundation.h>

// Protocol definition starts here
@protocol PhotoDownloaderDelegate <NSObject>
@required

- (void) processCompleted;
@end

// Protocol Definition ends here

@interface PhotoDownloader : NSObject
{
    // Delegate to respond back
    id <PhotoDownloaderDelegate> _delegate;
    
}

@property (nonatomic,strong) id delegate;
@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableDictionary *dic;
@property(nonatomic,retain) NSMutableString *value;
@property(nonatomic,retain) NSMutableArray *book_array;
@property(nonatomic,retain) NSMutableArray *array_of_image_filenames;
@property(nonatomic,retain) UIActivityIndicatorView *spinner;
-(void)print_array;

-(void)startSampleProcess; // Instance method

@end