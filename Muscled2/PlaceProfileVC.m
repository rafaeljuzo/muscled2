//
//  PlaceProfileVC.m
//  Muscled2
//
//  Created by Juzo Oda on 28/12/11.
//  Copyright (c) 2011 Digitalbr. All rights reserved.
//

#import "PlaceProfileVC.h"

@implementation PlaceProfileVC
@synthesize fotoDaLojaImageView = _fotoDaLojaImageView;
@synthesize labelTelefone;
@synthesize labelEndereco;
@synthesize fotoDaLoja, textoTelefone, textoEndereco, coordenadaAtual, numeroParaLigar;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fotoDaLojaImageView.image = fotoDaLoja;
    self.labelEndereco.text = textoEndereco;
    self.labelTelefone.text = textoTelefone;

}

- (void)viewDidUnload
{
    self.coordenadaAtual = nil;
    self.textoEndereco = nil;
    self.textoTelefone = nil;
    self.fotoDaLoja = nil;
    [self setFotoDaLojaImageView:nil];
    [self setLabelTelefone:nil];
    [self setLabelEndereco:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [coordenadaAtual release];
    [textoEndereco release];
    [textoTelefone release];
    [fotoDaLoja release];
    [self.fotoDaLojaImageView release];
    [self.labelTelefone release];
    [self.labelEndereco release];
    [super dealloc];
}

#pragma mark - IBAction

- (IBAction)tracarRota {
    NSString* addr = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%@&daddr=%@", coordenadaAtual, textoEndereco];
    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    [url release];
}

- (IBAction)mostrarNoMaps {
    NSString* addr = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",textoEndereco];
    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    [url release];
}

- (IBAction)ligarParaLoja {
    NSLog(@"ligar");
    NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", numeroParaLigar];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
}
@end
