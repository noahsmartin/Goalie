//
//  GLStatusBarView.h
//  Goalie
//
//  Created by Noah Martin on 9/13/14.
//
//

#import <UIKit/UIKit.h>

@interface GLStatusBarView : UIView

@property (nonatomic) int currentPosition;
@property (nonatomic) float dragOffset;
@property UILabel *firstTitle;
@property UILabel *secondTitle;
@property UILabel *thirdTitle;

@end
