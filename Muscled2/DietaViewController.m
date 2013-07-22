//
//  DietaViewController.m
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 22/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DietaViewController.h"

@interface DietaViewController (){
    NSArray *resultadoCalc;
}

@end

@implementation DietaViewController
@synthesize pesoTextField;
@synthesize objetivoSegControl;
@synthesize resultadoTableView;

- (IBAction)calcularDieta{
    [pesoTextField resignFirstResponder];
    CalculaDieta *calc = [[CalculaDieta alloc]init];
    resultadoCalc = [calc calculaDietaParaPeso:
                    [pesoTextField.text doubleValue] objetivo:objetivoSegControl.selectedSegmentIndex];
    [calc release];
    [resultadoTableView reloadData];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Dieta", @"Dieta");
        self.tabBarItem.image = [UIImage imageNamed:@"dieta.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setPesoTextField:nil];
    [self setObjetivoSegControl:nil];
    [self setResultadoTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // create a cell
    if ( cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:@"cell"];
    }
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f g", [[resultadoCalc objectAtIndex:indexPath.row] doubleValue]];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Calorias";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f kcal", [[resultadoCalc objectAtIndex:indexPath.row] doubleValue]];
            break;
        case 1:
            cell.textLabel.text = @"Carboidratos";
            break;
        case 2:
            cell.textLabel.text = @"Proteínas";
            break;
        case 3:
            cell.textLabel.text = @"Gorduras";
            break;
            
        default:
            break;
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [pesoTextField resignFirstResponder];
}


- (void)dealloc {
    [pesoTextField release];
    [objetivoSegControl release];
    [resultadoTableView release];
    [super dealloc];
}
@end
