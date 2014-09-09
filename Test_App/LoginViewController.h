#import <UIKit/UIKit.h>
@class LoginViewController;

@protocol LoginViewControllerDelegate
-(void)loginViewControllerDidFinish:(LoginViewController *)loginViewController;
@end

@interface LoginViewController : UIViewController

@property (nonatomic,assign) id delegate;
@property(nonatomic,retain) UITextField *textFieldUsername;
@property(nonatomic,retain) UITextField *textFieldPassword;

@end
