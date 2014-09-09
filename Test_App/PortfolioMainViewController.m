#import "PortfolioMainViewController.h"
#import "PortfolioChildViewController.h"

@interface PortfolioMainViewController ()

@end

@implementation PortfolioMainViewController
@synthesize images_list_array, showIndexImage;

- (id)init {
    self = [super init];
    if (self) {
        images_list_array = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

- (void)processLoading {
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    images_list_array = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"images_list"] mutableCopy];
    
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    PortfolioChildViewController *initialViewController = [self viewControllerAtIndex: showIndexImage];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (PortfolioChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    PortfolioChildViewController *childViewController = [[PortfolioChildViewController alloc] initWithNibName:@"APPChildViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(PortfolioChildViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(PortfolioChildViewController *)viewController index];
    
    index++;
    NSUInteger elements = [images_list_array count];
    
    if (index == elements) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    NSUInteger elements = [images_list_array count];
    return elements;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
