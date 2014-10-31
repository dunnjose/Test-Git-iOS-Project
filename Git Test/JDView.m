//
//  JDView.m
//  Git Test
//
//  Created by Dunn, Joseph on 10/27/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "JDView.h"
@interface JDView()

@end

@implementation JDView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(CGFloat)degToRad:(CGFloat)deg
{
    return deg / 180 * M_PI;
}

- (void)drawRect:(CGRect)rect
{

    /*************************
     ANGLE      RADIANS
     0          0
     45         .785
     90         1.57
     135        2.355
     180        3.14    M_PI
     225        3.925
     270        4.71
     315        5.495
     360        6.26
     
     ************************/
    
    CGFloat innerRadius = 20.;
    CGFloat startX = 10;
    CGFloat startY = self.bounds.size.height -10;
    CGPoint theStart = CGPointMake(startX, startY);
    CGPoint theCenter = CGPointMake(startX + innerRadius, startY - (startY * (1-(innerRadius/100))));
    
    UIBezierPath *aSegment = [UIBezierPath bezierPath];
    [aSegment moveToPoint:theStart];
    
    [aSegment addArcWithCenter:theCenter radius:innerRadius startAngle:[[self class] degToRad:180] endAngle:[[self class] degToRad:270] clockwise:YES];
    
    [aSegment addLineToPoint:CGPointMake(aSegment.currentPoint.x + (self.bounds.size.width * .80) - aSegment.currentPoint.x, aSegment.currentPoint.y)];
    
    [aSegment addArcWithCenter:CGPointMake(aSegment.currentPoint.x - innerRadius, startY - innerRadius)  radius:innerRadius
                    startAngle:[[self class] degToRad:0]
                      endAngle:[[self class] degToRad:90] clockwise:YES];
    
    [aSegment addCurveToPoint:CGPointMake(startX, startY)
                controlPoint1:CGPointMake(aSegment.currentPoint.x * .75, aSegment.currentPoint.y * .8)
                controlPoint2:CGPointMake(aSegment.currentPoint.x * .50, startY)];
    
    [aSegment closePath];
   
    
    UIColor *fillColor = [UIColor colorWithRed:84.0f/255.0f
                                         green:169.0f/255.0f
                                          blue:164.0f/255.0f
                                         alpha:.7];
    
    aSegment.lineWidth = 2;
    [fillColor  setFill];
    [[UIColor grayColor] setStroke];
    [aSegment fill];
    [aSegment stroke];
       
    /* Set the Label on the Story Board */
    self.newmerck.textColor = [UIColor whiteColor];
    self.newmerck.text = @"Merck";
      
    CGRect newRect = CGRectMake((aSegment.bounds.size.width / 2 -12), aSegment.bounds.size.height / 2 , 48, 30);
    
    self.newmerck.frame = newRect;
       
}



@end
