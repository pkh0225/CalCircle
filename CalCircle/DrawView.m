//
//  DrawView.m
//  CalCircle
//
//  Created by hyeoncheol yi on 12. 5. 30..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "DrawView.h"
#import "math.h"

@implementation DrawView
@synthesize m_x;
@synthesize m_y;
@synthesize m_rate;
@synthesize m_Angle;
@synthesize m_width;
@synthesize m_AngleX;
@synthesize m_AngleY;
@synthesize m_ConterX;
@synthesize m_height;
@synthesize m_Radius;
@synthesize m_ConterY;
@synthesize m_AngleX1;
@synthesize m_AngleY1;
@synthesize m_AngleX2;
@synthesize m_AngleY2;
@synthesize m_AngleX3;
@synthesize m_AngleY3;
@synthesize m_Ratewidth;
@synthesize m_Rateheight;
@synthesize m_FrameX;
@synthesize m_FrameY;
@synthesize m_FrameX1;
@synthesize m_FrameY1;
@synthesize m_FrameX2;
@synthesize m_FrameY2;
@synthesize m_FrameX3;
@synthesize m_FrameY3;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation. sqrt()
- (void)drawRect:(CGRect)rect
{
    if (!m_draw) return;

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);				
	CGContextSetLineWidth(context, 1.0);
	CGContextMoveToPoint(context, m_x, m_y);	
	CGContextAddLineToPoint(context, m_x + m_width, m_y);	
    CGContextAddLineToPoint(context, m_x + m_width, m_y + m_height);	
    CGContextAddLineToPoint(context, m_x, m_y + m_height);	
    CGContextAddLineToPoint(context, m_x, m_y);
    
    CGContextStrokePath(context); 
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);				
	CGContextSetLineWidth(context, 1.0);
	CGContextMoveToPoint(context, m_AngleX, m_AngleY);	
	CGContextAddLineToPoint(context, m_AngleX1, m_AngleY1);	
    CGContextAddLineToPoint(context, m_AngleX3 , m_AngleY3);	
    CGContextAddLineToPoint(context, m_AngleX2, m_AngleY2);	
    CGContextAddLineToPoint(context, m_AngleX, m_AngleY);

//	CGContextMoveToPoint(context, m_ConterX, m_ConterY);	
//	CGContextAddLineToPoint(context, m_AngleX, m_AngleY);	
//    CGContextMoveToPoint(context, m_ConterX, m_ConterY);	
//	CGContextAddLineToPoint(context, m_AngleX1, m_AngleY1);	
//    CGContextMoveToPoint(context, m_ConterX, m_ConterY);	
//	CGContextAddLineToPoint(context, m_AngleX2, m_AngleY2);	
//    CGContextMoveToPoint(context, m_ConterX, m_ConterY);	
//	CGContextAddLineToPoint(context, m_AngleX3, m_AngleY3);	
    
    CGContextStrokePath(context); 
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 1.0, 1.0);				
    CGContextAddArc(context, m_ConterX, m_ConterY, m_Radius, 0, 360, 0);
    CGContextStrokePath(context); 
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);				
	CGContextSetLineWidth(context, 1.0);
	CGContextMoveToPoint(context, m_FrameX, m_FrameY);	
	CGContextAddLineToPoint(context, m_FrameX1, m_FrameY1);	
    CGContextAddLineToPoint(context, m_FrameX3 , m_FrameY3);	
    CGContextAddLineToPoint(context, m_FrameX2, m_FrameY2);	
    CGContextAddLineToPoint(context, m_FrameX, m_FrameY);
    CGContextStrokePath(context); 
}

-(void)OnDraw
{
    m_Ratewidth = m_width * m_rate;
    m_Rateheight = m_height * m_rate;
    
    m_ConterX = (m_Ratewidth / 2.0) + (m_x - ((m_Ratewidth - m_width) / 2.0));
    m_ConterY = (m_Rateheight / 2.0) + (m_y - ((m_Rateheight - m_height) / 2.0));
        
    m_Radius = sqrt(pow(m_Ratewidth,2.0) + pow(m_Rateheight, 2.0)) / 2.0;
    
    double angleOne = 2.0 * M_PI / 360.0;
    
    double Angle =  asin((m_Ratewidth/2.0)/m_Radius) * 180.0 / M_PI;

//    NSLog(@"%f", Angle);
    
    m_AngleX = m_ConterX + (m_Radius * sin(angleOne * (m_Angle - Angle)) );
    m_AngleY = m_ConterY - (m_Radius * cos(angleOne * (m_Angle - Angle)) ); 
        
    m_AngleX1 = m_ConterX + (m_Radius * sin(angleOne * (m_Angle + Angle)));
    m_AngleY1 = m_ConterY - (m_Radius * cos(angleOne * (m_Angle + Angle))); 
    
    m_AngleX2 = m_ConterX + (m_Radius * sin(angleOne * (m_Angle - 180.0 + Angle)));
    m_AngleY2 = m_ConterY - (m_Radius * cos(angleOne * (m_Angle - 180.0 + Angle))); 
    
    m_AngleX3 = m_ConterX + (m_Radius * sin(angleOne * (m_Angle + 180.0 - Angle)));
    m_AngleY3 = m_ConterY - (m_Radius * cos(angleOne * (m_Angle + 180.0 - Angle)));
    
    double minX, minY, maxX, maxY;
    
    minX = MIN(MIN(MIN(m_AngleX, m_AngleX1),m_AngleX2),m_AngleX3);
    minY = MIN(MIN(MIN(m_AngleY, m_AngleY1),m_AngleY2),m_AngleY3);
    maxX = MAX(MAX(MAX(m_AngleX, m_AngleX1),m_AngleX2),m_AngleX3);
    maxY = MAX(MAX(MAX(m_AngleY, m_AngleY1),m_AngleY2),m_AngleY3);
    
    m_FrameX = minX;
    m_FrameY = minY;
    m_FrameX1 = maxX;
    m_FrameY1 = minY;
    m_FrameX2 = minX;
    m_FrameY2 = maxY;
    m_FrameX3 = maxX;
    m_FrameY3 = maxY;
    
    m_draw = YES;
    [self setNeedsDisplay];
}



@end
