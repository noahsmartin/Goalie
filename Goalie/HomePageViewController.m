//
//  HomePagerDataSource.m
//  Goalie
//
//  Created by Noah Martin on 9/7/14.
//
//

#import "HomePageViewController.h"

@interface HomePageViewController()

@property UIViewController* stats;
@property UIViewController* feed;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.stats = [aStoryboard instantiateViewControllerWithIdentifier:@"Stats"];
    self.feed = [aStoryboard instantiateViewControllerWithIdentifier:@"Feed"];
    [self setViewControllers:@[self.stats] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        
    }];
    [self setDataSource:self];
    UIPageControl* pageControl = [UIPageControl appearance];
    pageControl.backgroundColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if(viewController == self.stats) {
        return self.feed;
    }
    NSLog(@"after: %@", viewController);
        return nil;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if(viewController == self.feed) {
        return self.stats;
    }
    NSLog(@"before %@", viewController);
        return nil;
}


@end
