//
//  FirstViewController.m
//  Muscled2
//
//  Created by tecportal on 23/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

#pragma mark - ViewMethods

- (void) setupView{ 
    pageControlBeingUsed = NO;
    [self.view setBackgroundColor:[UIColor blackColor]];
    NSString *pathDasImagens = [[NSBundle mainBundle] pathForResource:@"imgensHomeList" ofType:@"plist"];
    self.imageList = [NSArray arrayWithContentsOfFile:pathDasImagens];
    
	for (int i = 0; i < self.imageList.count; i++) {
        
        CGRect frame;
        frame.origin.x = self.contentScroll.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.contentScroll.frame.size;
        
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:frame];
        tempImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.imageList objectAtIndex:i]]];
        [self.contentScroll addSubview:tempImageView];

	}

	self.contentScroll.contentSize = CGSizeMake(self.contentScroll.frame.size.width * self.imageList.count, self.contentScroll.frame.size.height);
	
	self.contentPage.currentPage = 0;
	self.contentPage.numberOfPages = self.imageList.count;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"empresa.png"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
	if (!pageControlBeingUsed) {
		// Switch the indicator when more than 50% of the previous/next page is visible
		CGFloat pageWidth = self.contentScroll.frame.size.width;
		int page = floor((self.contentScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
		self.contentPage.currentPage = page;
	}
    
    [sender setContentOffset: CGPointMake(sender.contentOffset.x, 0)];
        // or if you are sure you wanna it always on top:
        // [aScrollView setContentOffset: CGPointMake(aScrollView.contentOffset.x, 0)];

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.popOverViewController.view removeFromSuperview];
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - IBActions

- (IBAction)changePage{
    // Update the scroll view to the appropriate page
	CGRect frame;
	frame.origin.x = self.contentScroll.frame.size.width * self.contentPage.currentPage;
	frame.origin.y = 0;
	frame.size = self.contentScroll.frame.size;
	[self.contentScroll scrollRectToVisible:frame animated:YES];
	pageControlBeingUsed = YES;
}


- (IBAction)showPopOver:(id)sender {
    
    self.popOverViewController.view.frame = CGRectMake(0.0f, 480.0f, 320.0f, 480.0f); //notice this is OFF screen!
    [UIView beginAnimations:@"popOverViewController" context:nil];
    [UIView setAnimationDuration:0.4];
    self.popOverViewController.view.frame = CGRectMake(23.0f+(self.contentPage.currentPage*320), 70.0f, 275.0f, 270.0f); //notice this is ON screen!
    [self.contentScroll addSubview:self.popOverViewController.view];
    [UIView commitAnimations];
    
}

- (IBAction)closePopOver:(id)sender {
    
    [UIView beginAnimations:@"popOverViewControllerClose" context:nil];
    [UIView setAnimationDuration:0.4];
    [self.popOverViewController.view removeFromSuperview];
    [UIView commitAnimations];
    
}

@end






