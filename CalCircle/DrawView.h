//
//  DrawView.h
//  CalCircle
//
//  Created by hyeoncheol yi on 12. 5. 30..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
{
    BOOL m_draw;
}

@property (nonatomic, assign) double m_x;
@property (nonatomic, assign) double m_y;
@property (nonatomic, assign) double m_width;
@property (nonatomic, assign) double m_height;
@property (nonatomic, assign) double m_Ratewidth;
@property (nonatomic, assign) double m_Rateheight;
@property (nonatomic, assign) double m_rate;
@property (nonatomic, assign) double m_Angle;
@property (nonatomic, assign) double m_ConterX;
@property (nonatomic, assign) double m_ConterY;
@property (nonatomic, assign) double m_Radius;
@property (nonatomic, assign) double m_AngleX;
@property (nonatomic, assign) double m_AngleY;
@property (nonatomic, assign) double m_AngleX1;
@property (nonatomic, assign) double m_AngleY1;
@property (nonatomic, assign) double m_AngleX2;
@property (nonatomic, assign) double m_AngleY2;
@property (nonatomic, assign) double m_AngleX3;
@property (nonatomic, assign) double m_AngleY3;
@property (nonatomic, assign) double m_FrameX;
@property (nonatomic, assign) double m_FrameY;
@property (nonatomic, assign) double m_FrameX1;
@property (nonatomic, assign) double m_FrameY1;
@property (nonatomic, assign) double m_FrameX2;
@property (nonatomic, assign) double m_FrameY2;
@property (nonatomic, assign) double m_FrameX3;
@property (nonatomic, assign) double m_FrameY3;





-(void)OnDraw;


@end
