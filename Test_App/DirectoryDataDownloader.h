#import <Foundation/Foundation.h>
#import "Reachability.h"

@class DirectoryDataDownloader;

@protocol DirectoryDataDownloaderDelegate
- (void) directoryDownloadProcessCompleted;
@end

@interface DirectoryDataDownloader: NSObject

@property (nonatomic,assign) id delegate;
@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableDictionary *dic;
@property(nonatomic,retain) NSMutableString *value;
@property(nonatomic,retain) NSMutableArray *photographer_array;
@property(nonatomic,retain) NSMutableArray *array_of_image_filenames;
@property(nonatomic,retain) UIActivityIndicatorView *spinner;
@property(nonatomic,retain) Reachability *internetReachableFoo;

-(void)startDirectoryDownloadProcess; // Instance method

@end