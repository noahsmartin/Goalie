//
//  HomePagerDataSource.m
//  Goalie
//
//  Created by Noah Martin on 9/7/14.
//
//

#import "HomePageViewController.h"
#import "GLStatusBarView.h"

@interface HomePageViewController()

@property UIViewController* stats;
@property UIViewController* feed;
@property UIViewController* today;
@property GLStatusBarView* statusBarView;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.stats = [aStoryboard instantiateViewControllerWithIdentifier:@"Stats"];
    self.feed = [aStoryboard instantiateViewControllerWithIdentifier:@"Feed"];
    self.today = [aStoryboard instantiateViewControllerWithIdentifier:@"Today"];
    [self setViewController:self.stats];
    [self setDataSource:self];
    [self setDelegate:self];
    self.view.backgroundColor = [UIColor lightGrayColor];
   self.statusBarView = [[GLStatusBarView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    self.navigationItem.titleView = self.statusBarView;
    [super viewDidLoad];
    NSDictionary* attributes = [[UINavigationBar appearance] titleTextAttributes];
    NSLog(@"%@", attributes);
}

-(UIViewController*)mn_pageViewController:(MNPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if(viewController == self.stats) {
        return self.feed;
    } else if(viewController == self.feed) {
        return self.today;
    }
        return nil;
    
}

- (void)mn_pageViewController:(MNPageViewController *)pageViewController willPageToViewController:(UIViewController *)viewController withRatio:(CGFloat)ratio {
    if(viewController == nil) {
        // We don't want to animate the status bar if you scroll beyond the edges
        return;
    }
        if(pageViewController.viewController == self.stats) {
            self.statusBarView.currentPosition = 0;
        } else if(pageViewController.viewController == self.feed) {
            self.statusBarView.currentPosition = 1;
        } else if(pageViewController.viewController == self.today) {
            self.statusBarView.currentPosition = 2;
        }
    if(pageViewController.viewController != viewController) {
        self.statusBarView.dragOffset = ratio * (pageViewController.viewController == self.feed && viewController == self.stats ? -1 : 1);
    }
}

-(UIViewController*)mn_pageViewController:(MNPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if(viewController == self.feed) {
        return self.stats;
    } else if(viewController == self.today) {
        return self.feed;
    }
        return nil;
}


@end
