//
//  DietaViewController.h
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 22/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculaDieta.h"

@interface DietaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *pesoTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *objetivoSegControl;
@property (strong, nonatomic) IBOutlet UITableView *resultadoTableView;

- (IBAction)calcularDieta;

@end
