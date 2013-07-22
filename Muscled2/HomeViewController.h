//
//  FirstViewController.h
//  Muscled2
//
//  Created by tecportal on 23/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UIScrollViewDelegate, UIPopoverControllerDelegate>{
    int pageNumber;
    NSArray *imageList;
    NSArray *contentList;
    BOOL pageControlBeingUsed;
}
@property (nonatomic, weak) NSArray *imageList;
@property (nonatomic, retain) IBOutlet UIViewController *popOverViewController;

@property (nonatomic, retain) IBOutlet UIScrollView *contentScroll;
@property (nonatomic, retain) IBOutlet UIPageControl *contentPage;
@property (retain, nonatomic) IBOutlet UIButton *popButton;
@property (retain, nonatomic) IBOutlet UITextView *contentTextView;

- (IBAction)changePage;
- (IBAction)showPopOver:(id)sender;
- (IBAction)closePopOver:(id)sender;


@end
