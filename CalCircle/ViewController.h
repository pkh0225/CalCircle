//
//  ViewController.h
//  CalCircle
//
//  Created by hyeoncheol yi on 12. 5. 30..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"
@interface ViewController : UIViewController<UITextFieldDelegate>
{
    BOOL m_Start;
}

@property (retain, nonatomic) IBOutlet DrawView *m_DrawView;
@property (retain, nonatomic) IBOutlet UITextField *m_TfX;
@property (retain, nonatomic) IBOutlet UITextField *m_TfY;
@property (retain, nonatomic) IBOutlet UITextField *m_TfWidth;
@property (retain, nonatomic) IBOutlet UITextField *m_TfHeight;
@property (retain, nonatomic) IBOutlet UITextField *m_TfAngle;
@property (retain, nonatomic) IBOutlet UITextField *m_TfRate;
@property (retain, nonatomic) IBOutlet UITextView *m_TextView;
@property (retain, nonatomic) IBOutlet UIView *m_view;



- (IBAction)onBtnDraw:(id)sender;
-(void)onDraw;
-(void)onDraw2;
@end
