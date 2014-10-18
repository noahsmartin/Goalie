//
//  GLStatusBarView.m
//  Goalie
//
//  Created by Noah Martin on 9/13/14.
//
//

#import "GLStatusBarView.h"

@implementation GLStatusBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.firstTitle = [[UILabel alloc] initWithFrame:frame];
        self.secondTitle = [[UILabel alloc] initWithFrame:frame];
        self.thirdTitle = [[UILabel alloc] initWithFrame:frame];
        self.firstTitle.text = @"Goal Sheet";
        self.secondTitle.text = @"Feed";
        self.thirdTitle.text = @"Today";
        self.firstTitle.textAlignment = NSTextAlignmentCenter;
        self.secondTitle.textAlignment = NSTextAlignmentCenter;
        self.thirdTitle.textAlignment = NSTextAlignmentCenter;
        UIFont* font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        self.firstTitle.font = font;
        self.secondTitle.font = font;
        self.thirdTitle.font = font;
        self.firstTitle.textColor = [UIColor whiteColor];
        self.secondTitle.textColor = [UIColor whiteColor];
        self.thirdTitle.textColor = [UIColor whiteColor];
        [self.secondTitle setAlpha:0.0];
        [self.thirdTitle setAlpha:0.0];
        [self addSubview:self.firstTitle];
        [self addSubview:self.secondTitle];
        [self addSubview:self.thirdTitle];
    }
    return self;
}

-(void)setCurrentPosition:(int)currentPosition {
    if(_currentPosition != currentPosition) {
        _dragOffset = 0;
    }
    _currentPosition = currentPosition;
    [self setNeedsDisplay];
}

-(void)setDragOffset:(float)dragOffset {
    _dragOffset = dragOffset;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    float alpha = 0.5;
    float absOffset = fabs(self.dragOffset);
    if(self.currentPosition == 0) {
        alpha = 1.0-(absOffset/2);
    } else if(self.currentPosition == 1 && self.dragOffset < 0) {
        alpha = 0.5+(absOffset/2);
    }
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, alpha);
    CGRect circlePoint = CGRectMake(self.frame.size.width/2 - 12.5, self.frame.size.height-10, 5, 5);
    CGRect circlePoint2 = CGRectMake(self.frame.size.width/2 - 2.5, self.frame.size.height-10, 5, 5);
    CGRect circlePoint3 = CGRectMake(self.frame.size.width/2 + 7.5, self.frame.size.height-10, 5, 5);
    
    CGContextFillEllipseInRect(context, circlePoint);
    alpha = 0.5;
    if(self.currentPosition == 1) {
        alpha = 1.0-(absOffset/2);
    } else if(self.currentPosition == 0 || self.currentPosition == 2) {
        alpha = 0.5+(absOffset/2);
    }
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, alpha);
    CGContextFillEllipseInRect(context, circlePoint2);
    
    alpha = 0.5;
    if(self.currentPosition == 2) {
        alpha = 1.0-(absOffset/2);
    } else if(self.currentPosition == 1 && self.dragOffset > 0) {
        alpha = 0.5+(absOffset/2);
    }
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, alpha);
    CGContextFillEllipseInRect(context, circlePoint3);
    
    if(self.currentPosition == 0) {
        [self.firstTitle setAlpha:1.0 - absOffset];
        [self.secondTitle setAlpha:absOffset];
    } else if(self.currentPosition == 1) {
        if(self.dragOffset < 0) {
            [self.thirdTitle setAlpha:0];
            [self.firstTitle setAlpha:absOffset];
            [self.secondTitle setAlpha:1.0 - absOffset];
        } else if(self.dragOffset > 0) {
            [self.secondTitle setAlpha:1.0 - absOffset];
            [self.thirdTitle setAlpha:absOffset];
            [self.firstTitle setAlpha:0];
        }
    } else {
        [self.firstTitle setAlpha:0];
        [self.secondTitle setAlpha:self.dragOffset];
        [self.thirdTitle setAlpha:1.0 - self.dragOffset];
    }
}


@end
