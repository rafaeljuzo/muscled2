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

@property (strong, nonatomic) IBOutlet UITextView *descricaoTextView;

@property (strong, nonatomic) IBOutlet UIImageView *imagemDoProdutoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *tblCompImageView;

@property (strong, nonatomic) IBOutlet UIView *viewPrincipal;
@property (strong, nonatomic) IBOutlet UIView *tblCompView;

@property (strong, nonatomic) IBOutlet UIScrollView *fotoTextoScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *tblCompScrollView;

@property (nonatomic, strong) UIButton *flipIndicatorButton;
@property (nonatomic, strong) UIImage *imgFotoDoProduto;
@property (nonatomic, strong) UIImage *imgComparativo;
@property (nonatomic, strong) UIImage *imgTabelaNutricional;
@property (strong, nonatomic) IBOutlet UIButton *comparativoButton;

- (void) flipViewAtual;
- (IBAction)flipView:(UIButton *)sender;

@end
