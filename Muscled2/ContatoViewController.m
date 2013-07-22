//
//  ContatoViewController.m
//  Muscled2
//
//  Created by tecportal on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContatoViewController.h"

@implementation ContatoViewController
@synthesize botaoEnviar;
@synthesize nomeTextField,msgView;

#pragma mark - textView Delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - textField Delegate

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

#pragma mark - IBActions implementation
-(IBAction)sendMail:(id)sender
{
    NSString *assunto = [NSString stringWithFormat:@"Contato de %@", nomeTextField.text];
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:assunto];
    [controller setToRecipients:[NSArray arrayWithObject:@"contato@muscled2.com.br"]];
    [controller setMessageBody:msgView.text isHTML:NO];
    [self presentModalViewController:controller animated:YES];
    [controller release];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Contato", @"Contato");
    }
    return self;
}

- (IBAction)limparFields:(id)sender {
    nomeTextField.text = @"";
    msgView.text = @"";
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - MailCompose Delegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
    
    if (result == MFMailComposeResultSent) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensagem" message:@"Obrigado pelo contato. \n Assim que possível retornaremos." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    } if (result == MFMailComposeResultFailed) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensagem" message:@"Ocorreu um erro ao enviar o e-mail." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.msgView.layer.borderWidth = 1;
    self.msgView.layer.cornerRadius = 5;
    self.msgView.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)viewDidUnload
{
    nomeTextField = nil;
    msgView = nil;
    [self setBotaoEnviar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) dealloc{
    [nomeTextField release];
    [msgView release];
    [botaoEnviar release];
    [super dealloc];
}

@end
