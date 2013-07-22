//
//  ProdutoFotoViewController.h
//  Muscled2
//
//  Created by Juzo Oda on 02/07/12.
//  Copyright (c) 2012 Digitalbr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProdutoFotoViewController : UIViewController<UIScrollViewDelegate>{
    NSString *nomeProduto;
    UIImage *fotoImage;
}

@property (strong, nonatomic) IBOutlet UIScrollView *fotoScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *fotoImageView;
@property (nonatomic, strong) UIImage *fotoImage;
@property (nonatomic, strong) NSString *nomeProduto;

- (IBAction)backView;

@end
