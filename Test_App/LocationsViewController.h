#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface LocationsViewController : UIViewController <GMSMapViewDelegate>
@property(nonatomic,retain) NSMutableArray *photos_list_array;

@end
