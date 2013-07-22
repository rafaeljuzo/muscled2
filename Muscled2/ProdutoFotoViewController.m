//
//  ProdutoFotoViewController.m
//  Muscled2
//
//  Created by Juzo Oda on 02/07/12.
//  Copyright (c) 2012 Digitalbr. All rights reserved.
//

#import "ProdutoFotoViewController.h"

@implementation ProdutoFotoViewController
@synthesize fotoScrollView;
@synthesize fotoImageView, fotoImage, nomeProduto;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    fotoImage = [UIImage imageNamed:[NSString stringWithFormat:@"full%@@2x", nomeProduto]];
    fotoImageView.image = fotoImage;
}

- (void)viewDidUnload
{
    [self setFotoScrollView:nil];
    [self setFotoImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [fotoScrollView release];
    [fotoImageView release];
    [super dealloc];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return fotoImageView;
}

#pragma mark - IBAction
- (IBAction)backView {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
