//
//  ContatoViewController.h
//  Muscled2
//
//  Created by tecportal on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>


@interface ContatoViewController : UIViewController<MFMailComposeViewControllerDelegate, UITextViewDelegate>{
    
    IBOutlet UITextField *nomeTextField;
    IBOutlet UITextView *msgView;
    IBOutlet UIButton *botaoEnviar;
}

@property (nonatomic, retain) IBOutlet UITextField *nomeTextField;
@property (retain, nonatomic) IBOutlet UITextView *msgView;
@property (retain, nonatomic) IBOutlet UIButton *botaoEnviar;

-(IBAction)sendMail:(id)sender;
-(IBAction)limparFields:(id)sender;

@end
