#import <UIKit/UIKit.h>
#import "PhotoDownloader.h"

@interface ViewController : UIViewController<PhotoDownloaderDelegate>
{
    IBOutlet UILabel *myLabel;
}
@end