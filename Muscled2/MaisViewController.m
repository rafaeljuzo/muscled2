//
//  MaisViewController.m
//  Muscled2
//
//  Created by Juzo Oda on 17/04/12.
//  Copyright (c) 2012 Digitalbr. All rights reserved.
//

#import "MaisViewController.h"
#import "ContatoViewController.h"
#import "BuscarViewController.h"

@implementation MaisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Mais", @"Mais");
        self.tabBarItem.image = [UIImage imageNamed:@"mais.png"];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonTouched:(UIButton *)button {
    NSString *link = @"";
    
    switch (button.tag) {
        case 0:{
            ContatoViewController *contatoVC = [[ContatoViewController alloc] init];
            contatoVC.hidesBottomBarWhenPushed = YES;
            [[self navigationController] pushViewController:contatoVC animated:YES];
            [contatoVC release];
        }
            break;
        case 1:{
            BuscarViewController *buscarVC = [[BuscarViewController alloc] init];
            buscarVC.hidesBottomBarWhenPushed = YES;
            [[self navigationController] pushViewController:buscarVC animated:YES];
            [buscarVC release];
        }
            break;
        case 2:
            link = [NSString stringWithFormat:@"http://www.muscled2.com.br"];
            break;
        case 3:
            link = [NSString stringWithFormat:@"http://mobile.twitter.com/muscled2"];
            break;
        case 4:
            link = [NSString stringWithFormat:@"fb://profile/289411941079921"];
            break;
        case 5:
            link = [NSString stringWithFormat:@"http://www.youtube.com/user/muscled23"];
            break;
            
        default:
            break;
    }
    
    if (link != @"") {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:link]];
    }

}

@end
