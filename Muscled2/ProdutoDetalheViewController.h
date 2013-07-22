//
//  ProdutoDetalheViewController.h
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 25/12/11.
//  Copyright (c) 2012 Clitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProdutoFotoViewController.h"

@interface ProdutoDetalheViewController : UIViewController<UIScrollViewDelegate>{
    NSString *textoDaDescricao;
    NSString *nomeDoProduto;
    UIImage *imgFotoDoProduto;
    UIImage *imgTabelaNutricional;
    UIImage *imgComparativo;
    UIButton *tabelNutricionalButton;
}

@property (strong, nonatomic) id detailItem;
@property (nonatomic, copy) NSString *nomeDoProduto;
@property (nonatomic, copy) NSString *textoDaDescricao;

@property (retain, nonatomic) IBOutlet UITextView *descricaoTextView;

@property (retain, nonatomic) IBOutlet UIImageView *imagemDoProdutoImageView;
@property (retain, nonatomic) IBOutlet UIImageView *tblCompImageView;

@property (retain, nonatomic) IBOutlet UIView *viewPrincipal;
@property (retain, nonatomic) IBOutlet UIView *tblCompView;

@property (retain, nonatomic) IBOutlet UIScrollView *fotoTextoScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *tblCompScrollView;

@property (nonatomic, retain) UIButton *flipIndicatorButton;
@property (nonatomic, retain) UIImage *imgFotoDoProduto;
@property (nonatomic, retain) UIImage *imgComparativo;
@property (nonatomic, retain) UIImage *imgTabelaNutricional;
@property (retain, nonatomic) IBOutlet UIButton *comparativoButton;

- (void) flipViewAtual;
- (IBAction)flipView:(UIButton *)sender;

@end
