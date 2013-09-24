//
//  FirstViewController.h
//  Muscled2
//
//  Created by tecportal on 23/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuscarManager.h"

@interface HomeViewController : UIViewController <UIScrollViewDelegate, UIPopoverControllerDelegate>{
    int pageNumber;
    BOOL pageControlBeingUsed;
}
@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, strong) IBOutlet UIViewController *popOverViewController;

@property (nonatomic, strong) IBOutlet UIScrollView *contentScroll;
@property (nonatomic, strong) IBOutlet UIPageControl *contentPage;
@property (nonatomic, strong) IBOutlet UIButton *popButton;
@property (nonatomic, strong) IBOutlet UITextView *contentTextView;

- (IBAction)changePage;
- (IBAction)showPopOver:(id)sender;
- (IBAction)closePopOver:(id)sender;


@end
