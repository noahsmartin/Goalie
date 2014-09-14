//
//  BaseGoal.m
//  Goalie
//
//  Created by Noah Martin on 9/13/14.
//
//

#import "BaseGoal.h"

@implementation BaseGoal

-(double)getAmountCompleted {
    switch (self.goalStatus) {
        case GLGoalComplete:
            return 1;
        default:
            return 0;
    }
}

@end
