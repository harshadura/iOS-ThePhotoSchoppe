#import <UIKit/UIKit.h>

// Tell the compiler to conform to these protocols
@interface DirectoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,assign) id delegate;
@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableDictionary *dic;
@property(nonatomic,retain) NSMutableString *value;
@property(nonatomic,retain) NSMutableArray *photographer_array;

@end