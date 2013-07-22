//
//  ProdutosViewController.h
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 23/12/11.
//  Copyright (c) 2012 Clitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProdutosViewController: UIViewController<UITableViewDataSource, UITableViewDelegate,
UISearchBarDelegate, UISearchDisplayDelegate, UIGestureRecognizerDelegate>{
    NSArray *produtosArray;
    NSArray *descricoesProdutosArray;
    NSMutableArray *listaProdutos;
    NSMutableArray *resultadosBusca;
    NSString *savedSearchTerms;
}

@property (nonatomic,strong) IBOutlet UITableView *produtosTableView;
@property (nonatomic,strong) NSMutableArray *listaProdutos;
@property (nonatomic,strong) NSMutableArray *resultadosBusca;
@property (nonatomic, copy) NSString *savedSearchTerms;

- (void) handleSearchForTerm: (NSString *) searchTerm;

@end