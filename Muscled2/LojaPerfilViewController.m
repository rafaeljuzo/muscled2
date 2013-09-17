//
//  LojaPerfilViewController.m
//  Muscled2
//
//  Created by Rafael Oda on 8/20/13.
//
//

#import "LojaPerfilViewController.h"

@interface LojaPerfilViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@end

@implementation LojaPerfilViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    [self.name setText:self.loja.title];
    [self.address setText:self.loja.endereco];
    [self.phone setText:self.loja.telefone];
    
}
- (IBAction)tracarRota:(id)sender {
    
    NSString * ll = [NSString stringWithFormat:@"%f,%f",self.loja.coordinate.latitude, self.loja.coordinate.longitude];

    NSString* addr = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@", ll];
    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)ligar:(id)sender {
    
    
    NSString* number = [NSString stringWithFormat:@"tel:%@", self.loja.telefone];
    NSString * strippedNumber = [number stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [number length])];
    
    NSURL* url = [[NSURL alloc] initWithString:strippedNumber];
    [[UIApplication sharedApplication] openURL:url];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
