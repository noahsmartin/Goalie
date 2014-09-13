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
    float alpha = self.currentPosition == 0 ? 1.0-(self.dragOffset/2) : 0.5+(self.dragOffset/2);
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, alpha);
    CGRect circlePoint = CGRectMake(self.frame.size.width/2 - 5, self.frame.size.height-10, 5, 5);
    CGRect circlePoint2 = CGRectMake(self.frame.size.width/2 + 5, self.frame.size.height-10, 5, 5);
    
    CGContextFillEllipseInRect(context, circlePoint);
    alpha = self.currentPosition == 1 ? 1.0-(self.dragOffset/2) : 0.5+(self.dragOffset/2);
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, alpha);
    CGContextFillEllipseInRect(context, circlePoint2);
}


@end
