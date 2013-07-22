//
//  VideoViewController.m
//  Muscled2
//
//  Created by tecportal on 23/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VideosViewController.h"

@implementation VideosViewController
@synthesize webView;
@synthesize activityIndic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Vídeos", @"Vídeos");
        self.tabBarItem.image = [UIImage imageNamed:@"videos.png"];
    }
    return self;
}

# pragma mark - UIWebView Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [activityIndic startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [activityIndic stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    int myErrorCode;
    
    [activityIndic stopAnimating];
    
    myErrorCode = [error code]; // myErrorCode = -999 if user cancel action, not network problem
    if (myErrorCode != -999)
    {
        // Your error handling code here
        NSLog(@"UIWebView Load Failed-Error");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de Conexão!" message:@"Não foi possível carregar os dados. Cheque sua conexão com a Internet." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
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
    //Load the request in the UIWebView.
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.youtube.com/user/muscled2/videos"]]];
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setActivityIndic:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



@end
