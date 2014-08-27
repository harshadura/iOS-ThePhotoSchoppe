#import <Foundation/Foundation.h>

@class PhotoDownloader;

@protocol PhotoDownloaderDelegate
- (void) processCompleted;
@end

@interface PhotoDownloader: NSObject

@property (nonatomic,assign) id delegate;
@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableDictionary *dic;
@property(nonatomic,retain) NSMutableString *value;
@property(nonatomic,retain) NSMutableArray *book_array;
@property(nonatomic,retain) NSMutableArray *array_of_image_filenames;
@property(nonatomic,retain) UIActivityIndicatorView *spinner;

-(void)startSampleProcess; // Instance method

@end