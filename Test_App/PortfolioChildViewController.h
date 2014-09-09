#import <UIKit/UIKit.h>
#import "RateView.h"

@interface PortfolioChildViewController : UIViewController <RateViewDelegate>

@property (strong, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (nonatomic)  BOOL *isTappFirstTime;
@property (strong, nonatomic) UIButton *btnRate;
@property (strong, nonatomic) UIButton *btnShare;
@property (strong, nonatomic) UILabel *lblOveralRating;
@property (strong, nonatomic) NSString *textOveralRating;
@property (strong, nonatomic) NSString *textUserRating;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic) CGRect prevFrame;
@property (strong, nonatomic) UIImageView *fullscreenImageView;
@property (strong, nonatomic) UITapGestureRecognizer *tapTwice;
@property (strong, nonatomic) NSString *pngPath;

@end
