//
//  BaseGoal.h
//  Goalie
//
//  Created by Noah Martin on 9/13/14.
//
//

#import <Foundation/Foundation.h>

@interface BaseGoal : NSObject

typedef NS_ENUM(NSInteger, GLGoalType) {
    GLBaseGoal,
    GLRunDistance,
    GLRunSteps
};

typedef NS_ENUM(NSInteger, GLGoalStatus) {
    GLGoalNotStarted,
    GLGoalInProgress,
    GLGoalComplete
};

@property GLGoalType goalType;
@property GLGoalStatus goalStatus;
@property NSString* title;

// This represents how often the goal should be completed.
// It is expressed in number of days, so 1 represents once
// a day, 0.5 is twice a day, 365 is once a year...
@property double frequency;

// If this is true the goal is public, otherwise it is only
// visible to users in sharedUsers
@property BOOL visibleToPublic;
@property NSArray* sharedUsers;

@property NSDate* dateCreated;
// The stop date may be nil.
@property NSDate* stopDate;
// True if the goal is still being pursued, always
// false if past the stopDate.
@property BOOL active;

// Returns an indication of how close this goal is to being finished
// 1 indicates a finished goal, 0 inidcates a not started goal.
-(double)getAmountCompleted;
@end
