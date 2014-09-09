#import <UIKit/UIKit.h>

@interface PortfolioMainViewController : UIViewController <UIPageViewControllerDataSource, NSURLConnectionDelegate>

@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableArray *images_list_array;
@property(nonatomic) NSUInteger showIndexImage;

@end
