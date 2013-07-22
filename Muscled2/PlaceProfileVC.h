//
//  PlaceProfileVC.h
//  Muscled2
//
//  Created by Juzo Oda on 28/12/11.
//  Copyright (c) 2011 Digitalbr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceProfileVC : UIViewController{
    UIImage *fotoDaLoja;
    NSString *textoTelefone;
    NSString *textoEndereco;
    NSString *numeroParaLigar;
}

@property (nonatomic, retain) UIImage *fotoDaLoja;
@property (nonatomic, copy) NSString *textoTelefone;
@property (nonatomic, copy) NSString *textoEndereco;
@property (nonatomic, copy) NSString *coordenadaAtual;
@property (nonatomic, copy) NSString *numeroParaLigar;

@property (retain, nonatomic) IBOutlet UIImageView *fotoDaLojaImageView;
@property (retain, nonatomic) IBOutlet UILabel *labelTelefone;
@property (retain, nonatomic) IBOutlet UILabel *labelEndereco;

- (IBAction)tracarRota;
- (IBAction)mostrarNoMaps;
- (IBAction)ligarParaLoja;

@end
