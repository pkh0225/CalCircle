//
//  ViewController.m
//  CalCircle
//
//  Created by hyeoncheol yi on 12. 5. 30..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize m_DrawView;
@synthesize m_TfX;
@synthesize m_TfY;
@synthesize m_TfWidth;
@synthesize m_TfHeight;
@synthesize m_TfAngle;
@synthesize m_TfRate;
@synthesize m_TextView;
@synthesize m_view;

//키보드를 사라지게 하기 위해 사용하는 재귀함수 직접 호출하지 않는다. 
- (void)_hideKeyboardRecursion:(UIView*)view 
{
	if ([view conformsToProtocol:@protocol(UITextInputTraits)]) 
	{
		[view resignFirstResponder];
	}
	
	if ([view.subviews count]>0) 
	{
		for (int i = 0; i < [view.subviews count]; i++) 
		{
			[self _hideKeyboardRecursion:[view.subviews objectAtIndex:i]];
		}
	}
}


//키보드 감추기
- (void)hideKeyboard 
{
	UIWindow *tempWindow;
	
	for (int c=0; c < [[[UIApplication sharedApplication] windows] count]; c++) 
	{
		tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:c];
        
		for (int i = 0; i < [tempWindow.subviews count]; i++) 
		{
			[self _hideKeyboardRecursion:[tempWindow.subviews objectAtIndex:i]];
		}
	}
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    m_Start = NO;
}

- (void)viewDidUnload
{
    
    [self setM_DrawView:nil];
    [self setM_TfX:nil];
    [self setM_TfY:nil];
    [self setM_TfWidth:nil];
    [self setM_TfHeight:nil];
    [self setM_TfAngle:nil];
    [self setM_TfRate:nil];
    [self setM_TextView:nil];
    [self setM_view:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [m_DrawView release];
    [m_TfX release];
    [m_TfY release];
    [m_TfWidth release];
    [m_TfHeight release];
    [m_TfAngle release];
    [m_TfRate release];
    [m_TextView release];
    [m_view release];
    [super dealloc];
}
- (IBAction)onBtnDraw:(id)sender {
    [self hideKeyboard];
    
    m_Start = !m_Start;
    
    m_DrawView.m_x = [m_TfX.text floatValue];
    m_DrawView.m_y = [m_TfY.text floatValue];
    m_DrawView.m_width = [m_TfWidth.text floatValue];
    m_DrawView.m_height = [m_TfHeight.text floatValue];
    m_DrawView.m_Angle = [m_TfAngle.text floatValue];
    m_DrawView.m_rate = [m_TfRate.text floatValue];
    
    if (((UIButton*)sender).tag == 1)
        [self onDraw];
    else {
        [self onDraw2];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{   
    [self hideKeyboard];
}

-(void)onDraw
{
    [m_DrawView OnDraw];
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"m_AngleX = %f\n", m_DrawView.m_AngleX];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY = %f\n", m_DrawView.m_AngleY]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX1 = %f\n", m_DrawView.m_AngleX1]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY1 = %f\n", m_DrawView.m_AngleY1]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX2 = %f\n", m_DrawView.m_AngleX2]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY2 = %f\n", m_DrawView.m_AngleY2]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX3 = %f\n", m_DrawView.m_AngleX3]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY3 = %f\n", m_DrawView.m_AngleY3]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleRatewidth = %f\n", m_DrawView.m_Ratewidth]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleRateheight = %f\n", m_DrawView.m_Rateheight]];
    [str appendString:  [NSString stringWithFormat:@"m_Radius = %f\n", m_DrawView.m_Radius]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameX = %f\n", m_DrawView.m_FrameX]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameY = %f\n", m_DrawView.m_FrameY]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameX1 = %f\n", m_DrawView.m_FrameX1]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameY1 = %f\n", m_DrawView.m_FrameY1]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameX2 = %f\n", m_DrawView.m_FrameX2]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameY2 = %f\n", m_DrawView.m_FrameY2]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameX3 = %f\n", m_DrawView.m_FrameX3]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameY3 = %f\n", m_DrawView.m_FrameY3]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameRatewidth = %f\n", m_DrawView.m_FrameX1 - m_DrawView.m_FrameX]];
    [str appendString:  [NSString stringWithFormat:@"m_FrameRateheight = %f\n", m_DrawView.m_FrameY3 - m_DrawView.m_FrameY]];

    m_TextView.text = str;
    
    if ((([m_TfAngle.text intValue]+1) < 360.0) && (m_Start))
    {
        m_DrawView.m_Angle += 5.0;
        m_TfAngle.text = [NSString stringWithFormat:@"%d",[m_TfAngle.text intValue]+5];
        [self performSelector:@selector(onDraw) withObject:nil afterDelay:0.1];
    }
    else {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(onDraw) object:nil];
        m_Start = NO;
        m_TfAngle.text = [NSString stringWithFormat:@"%d",0];
    }
}

-(void)onDraw2
{
    [m_DrawView OnDraw];
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"m_AngleX = %f\n", m_DrawView.m_AngleX];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY = %f\n", m_DrawView.m_AngleY]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX1 = %f\n", m_DrawView.m_AngleX1]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY1 = %f\n", m_DrawView.m_AngleY1]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX2 = %f\n", m_DrawView.m_AngleX2]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY2 = %f\n", m_DrawView.m_AngleY2]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleX3 = %f\n", m_DrawView.m_AngleX3]];
    [str appendString:  [NSString stringWithFormat:@"m_AngleY3 = %f\n", m_DrawView.m_AngleY3]];
    [str appendString:  [NSString stringWithFormat:@"m_Ratewidth = %f\n", m_DrawView.m_Ratewidth]];
    [str appendString:  [NSString stringWithFormat:@"m_Rateheight = %f\n", m_DrawView.m_Rateheight]];
    [str appendString:  [NSString stringWithFormat:@"m_Radius = %f\n", m_DrawView.m_Radius]];
    
    m_TextView.text = str;
}

@end
