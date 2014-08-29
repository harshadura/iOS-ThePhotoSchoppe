#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UIImageView *myImageView;
}
@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;
@property(nonatomic,retain)UIImageView *myImageView;
@end