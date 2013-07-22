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

@property (retain, nonatomic) IBOutlet UIScrollView *fotoScrollView;
@property (retain, nonatomic) IBOutlet UIImageView *fotoImageView;
@property (nonatomic, retain) UIImage *fotoImage;
@property (nonatomic, retain) NSString *nomeProduto;

- (IBAction)backView;

@end
