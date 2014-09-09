#import <UIKit/UIKit.h>

@interface DirectoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,assign) id delegate;
@property (strong, nonatomic) UIPageViewController *pageController;
@property(nonatomic,retain) NSMutableDictionary *dic;
@property(nonatomic,retain) NSMutableString *value;
@property(nonatomic,retain) NSMutableArray *photographer_array;

@end