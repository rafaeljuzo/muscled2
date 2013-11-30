//
//  ProdutoDetalheViewController.m
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 25/12/11.
//  Copyright (c) 2012 Clitz. All rights reserved.
//

#import "ProdutoDetalheViewController.h"
#define ZOOM_STEP 2.0

@interface ProdutoDetalheViewController(){
    BOOL comparativo;
    BOOL viewPricipalVisivel;
}

- (void)configureView;
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;

@end

@implementation ProdutoDetalheViewController
@synthesize comparativoButton = _comparativoButton, tblCompView = _tblCompView, tblCompScrollView = _tblCompScrollView, fotoTextoScrollView = _fotoTextoScrollView,
detailItem = _detailItem, descricaoTextView = _descricaoTextView, imagemDoProdutoImageView = _imagemDoProdutoImageView, tblCompImageView = _tblCompImageView,
viewPrincipal = _viewPrincipal, textoDaDescricao, imgFotoDoProduto, flipIndicatorButton = _flipIndicatorButton, imgTabelaNutricional, imgComparativo, nomeDoProduto;

#pragma mark - Methods

- (void)touchesBegan:(UITapGestureRecognizer *)gesture{
    ProdutoFotoViewController *fotoProdutoVC = [[ProdutoFotoViewController alloc] init];
    fotoProdutoVC.nomeProduto = self.nomeDoProduto;
    [self.navigationController pushViewController:fotoProdutoVC animated:YES];
}

- (void)configureView{
    
    
    //Gesture Recognizers for the Product View
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    
    //Controla qual é a View que está visível na hierarquia.
    viewPricipalVisivel = YES;
    
    NSString * imgName = [NSString stringWithFormat:@"%@.png", nomeDoProduto];
    UIImageView *productImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    [self.fotoTextoScrollView addSubview:productImage];
    [self.fotoTextoScrollView addGestureRecognizer:doubleTap];
    
    
    UITextView * txtView = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + productImage.frame.size.height, self.view.frame.size.width, 400.0f)];
    txtView.text = textoDaDescricao;
    txtView.textColor = [UIColor whiteColor];
    txtView.backgroundColor = [UIColor blackColor];
    [self.fotoTextoScrollView addSubview:txtView];
    txtView.editable = NO;
    txtView.scrollEnabled = NO;
    

    
        UIButton * compareBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, productImage.frame.size.height + txtView.frame.size.height, 140, 50)];
        [compareBtn setTitle:@"Comparativo" forState:UIControlStateNormal];
    
        imgComparativo = [UIImage imageNamed:[NSString stringWithFormat:@"cmp%@@2x.png", nomeDoProduto]];
        compareBtn.backgroundColor =[UIColor colorWithRed:100/255.0 green:150/255.0 blue:180/255.0 alpha:1];
        compareBtn.titleLabel.textColor = [UIColor whiteColor];
        compareBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [compareBtn addTarget:self action:@selector(flipComparativo:) forControlEvents:(UIControlEventTouchDown)];
    
        [self.fotoTextoScrollView addSubview: compareBtn];
    
        UIButton * tabelaNut = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 160, productImage.frame.size.height +txtView.frame.size.height, 140, 50)];
        [tabelaNut setTitle:@"Tabela Nutricional" forState:UIControlStateNormal];
         imgTabelaNutricional = [UIImage imageNamed:[NSString stringWithFormat:@"tbl%@@2x.png", nomeDoProduto]];
        tabelaNut.backgroundColor =[UIColor colorWithRed:100/255.0 green:150/255.0 blue:180/255.0 alpha:1];
        tabelaNut.titleLabel.textColor = [UIColor whiteColor];
        tabelaNut.titleLabel.font = [UIFont systemFontOfSize:12];
        [tabelaNut addTarget:self action:@selector(flipTabela:) forControlEvents:(UIControlEventTouchDown)];
        
        [self.fotoTextoScrollView addSubview: tabelaNut];
    
        self.fotoTextoScrollView.contentSize = CGSizeMake(self.view.frame.size.width, productImage.frame.size.height + txtView.frame.size.height + 50);
    
    
    
//    self.hidesBottomBarWhenPushed = YES;
//    
//    imgFotoDoProduto = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", nomeDoProduto]];
//    imgTabelaNutricional = [UIImage imageNamed:[NSString stringWithFormat:@"tbl%@@2x.png", nomeDoProduto]];
//    imgComparativo = [UIImage imageNamed:[NSString stringWithFormat:@"cmp%@@2x.png", nomeDoProduto]];
//    
//    self.descricaoTextView.text =  textoDaDescricao;
//    viewPricipalVisivel = YES;
//    
//    self.imagemDoProdutoImageView.image = imgFotoDoProduto;
//    self.tblCompImageView.image = imgTabelaNutricional;
//    
//    self.imagemDoProdutoImageView.userInteractionEnabled = YES;
//    self.tblCompImageView.userInteractionEnabled = YES;
//    
//    self.imagemDoProdutoImageView.tag = 0;
//    self.tblCompImageView.tag = 1;
//    self.descricaoTextView.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan:)];
//    
//    singleTap.cancelsTouchesInView = NO; 
//    [self.imagemDoProdutoImageView addGestureRecognizer:singleTap];   
//    
//    UIButton *localFlipIndicator =[[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
//	self.flipIndicatorButton=localFlipIndicator;
//
//	[self.flipIndicatorButton setBackgroundImage:[UIImage imageNamed:@"tblIcon.png"] forState:UIControlStateNormal];
//    
//	UIBarButtonItem *flipButtonBarItem;
//	flipButtonBarItem = [[UIBarButtonItem alloc] initWithCustomView:self.flipIndicatorButton];
//	
//    [self.navigationItem setRightBarButtonItem:flipButtonBarItem animated:YES];
//    
//    
//	[self.flipIndicatorButton addTarget:self action:@selector(flipViewAtual) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    self.descricaoTextView.frame = CGRectMake(0, 305, 320, self.descricaoTextView.contentSize.height);
//    
//    CGFloat frameHeight = self.imagemDoProdutoImageView.frame.size.height + self.descricaoTextView.contentSize.height;
//    self.fotoTextoScrollView.contentSize = CGSizeMake(320, frameHeight + 45);
//    
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
//    
//    
//    [doubleTap setNumberOfTapsRequired:2];
//    [twoFingerTap setNumberOfTouchesRequired:2];
//    
//    self.tblCompImageView.gestureRecognizers = [NSArray arrayWithObjects:doubleTap, twoFingerTap, nil];
//    
//    
//    if (self.imgComparativo != NULL) {   
//        CGRect buttonFrame = self.comparativoButton.frame;
//        buttonFrame.origin.y = frameHeight;
//        self.comparativoButton.frame = buttonFrame;
//        [self.comparativoButton setHidden:NO];
//    }
}


- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    zoomRect.size.height = [self.imagemDoProdutoImageView frame].size.height / scale;
    zoomRect.size.width  = [self.imagemDoProdutoImageView frame].size.width  / scale;
    
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0); 
    
    return zoomRect;
}

-(IBAction)flipComparativo:(id)sender
{
    comparativo = YES;
    [self flipViewAtual];

}

-(IBAction)flipTabela:(id)sender
{
    comparativo = NO;
    [self flipViewAtual];
}

- (void)flipViewAtual{
    
    if (comparativo) {
        self.tblCompImageView.image = imgComparativo;
    }
    else{
        self.tblCompImageView.image = imgTabelaNutricional;
    }
    
	self.tblCompView.userInteractionEnabled = NO;
	self.flipIndicatorButton.userInteractionEnabled = NO;
	
	//Flip da views
	[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(fimDaTransicao)];
	
	
    if (viewPricipalVisivel==YES) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.viewPrincipal cache:YES];
        self.viewPrincipal = self.view;
        [self.viewPrincipal addSubview:self.tblCompView];
        self.tblCompView.userInteractionEnabled = YES;
        
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.viewPrincipal cache:YES];
        [self.tblCompView removeFromSuperview];
    }
	[UIView commitAnimations];
	
	
    //Flip do Botão
	[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(fimDaTransicao)];
    
	if (viewPricipalVisivel==YES)
	{
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.flipIndicatorButton cache:YES];
		[self.flipIndicatorButton setBackgroundImage:[UIImage imageNamed:@"produtoIcon.png"] forState:UIControlStateNormal];
	}
	else
	{
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.flipIndicatorButton cache:YES];
		[self.flipIndicatorButton setBackgroundImage:[UIImage imageNamed:@"tblIcon.png"] forState:UIControlStateNormal];
		
	}
	[UIView commitAnimations];
    
	viewPricipalVisivel = !viewPricipalVisivel;
    comparativo = NO;
    
}

- (void)fimDaTransicao{
	self.view.userInteractionEnabled = YES;
	self.flipIndicatorButton.userInteractionEnabled = YES;
    self.tblCompScrollView.zoomScale = 1.0;
}

#pragma mark Controlando o detailItem

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem; 
        
        [self configureView];
    }
}

#pragma mark - IBActions
- (IBAction)flipView:(UIButton *)sender {
    comparativo = TRUE;
    [self flipViewAtual];
}

#pragma mark - TapDetectingImageViewDelegate methods

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
    UIImageView * cmpImage = [[UIImageView alloc] initWithImage:self.imgComparativo];
    [self.fotoTextoScrollView addSubview:cmpImage];
    
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer {
    float newScale = 1.0;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [self.tblCompScrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    if (scrollView.tag == 0) 
        return self.imagemDoProdutoImageView;
    else
        return self.tblCompImageView;
}

#pragma mark - View LifeCycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.title = NSLocalizedString(nomeDoProduto, @"ProdutoDetail");
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configureView];
}


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
}


@end
