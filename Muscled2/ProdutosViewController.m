//
//  ProdutosViewController.m
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 23/12/11.
//  Copyright (c) 2012 Clitz. All rights reserved.
//

#import "ProdutosViewController.h"
#import "ProdutoDetalheViewController.h"

@implementation ProdutosViewController

@synthesize produtosTableView = _produtosTableView, listaProdutos, resultadosBusca, savedSearchTerms;

#pragma mark -  Methods

- (void) handleSearchForTerm: (NSString *) searchTerm{
    [self setSavedSearchTerms:searchTerm];
    
    if ([self resultadosBusca] == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setResultadosBusca:array];
         array=nil;
    }
    
    [[self resultadosBusca] removeAllObjects];
    
    if ([[self savedSearchTerms] length] !=0){
        for (NSString *currentString in [self listaProdutos]){
            if ([currentString rangeOfString:searchTerm 
                                     options:NSCaseInsensitiveSearch].location != NSNotFound)
                [[self resultadosBusca] addObject:currentString];
        }
    }
}

- (BOOL) onSearch: (UITableView *)tableView{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return YES;
    else
        return NO;
}


#pragma mark - UITableView
#pragma mark DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self onSearch:tableView])
        return 1;
    else
        return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self onSearch:tableView])
        return @"Resultado da Pesquisa";
    else{    
        if ( section == 0 ) return @"Linha Profissíonal";
        if ( section == 1 ) return @"Linha Fitness";
        if ( section == 2 ) return @"Muscled Bar";
        return @"Outra";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ 
    int rows;
    
    if ([self onSearch:tableView])
        rows = [[self resultadosBusca] count];
    else{
        if ( section == 0 ) rows = 10;
        if ( section == 1 ) rows = 2;
        if ( section == 2 ) rows = 2;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *nomeDoProduto = nil;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if ( cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    int theRow = indexPath.row;
    if ([self onSearch:tableView]){
        nomeDoProduto = [[self resultadosBusca] objectAtIndex:theRow];
    } else {  
        if ( indexPath.section == 1 ) theRow += 10;
        if ( indexPath.section == 2 ) theRow += 12;
        if ( indexPath.section == 3 ) theRow += 14;
        
        nomeDoProduto = [produtosArray objectAtIndex:theRow];
    }
    
    cell.textLabel.text = nomeDoProduto;
    UIImage *imagemDoProdutoNaCell = [UIImage imageNamed:[NSString stringWithFormat:@"ic%@@2x.png", cell.textLabel.text]];
    cell.imageView.image = imagemDoProdutoNaCell;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{   
    int theRow = indexPath.row;
    ProdutoDetalheViewController *detalheViewController = [[ProdutoDetalheViewController alloc] init];
    if ([self onSearch:tableView]){
        NSString *produtoNoSearch = [resultadosBusca objectAtIndex:theRow];
        
        detalheViewController.nomeDoProduto = [NSString stringWithFormat:@"%@", produtoNoSearch];
        
        for(int i=0; i<=[produtosArray count]; i++){
            if([[produtosArray objectAtIndex:i] isEqualToString:[resultadosBusca objectAtIndex:theRow]]){
                detalheViewController.textoDaDescricao = [descricoesProdutosArray objectAtIndex:i];
                break;
            }
        }
    } else {
        if ( indexPath.section == 1 ) theRow += 10;
        if ( indexPath.section == 2 ) theRow += 12;
        if ( indexPath.section == 3 ) theRow += 14;
        NSString *produtoNaLista = [produtosArray objectAtIndex:theRow];
        
        detalheViewController.nomeDoProduto = [NSString stringWithFormat:@"%@", produtoNaLista];
        detalheViewController.textoDaDescricao = [descricoesProdutosArray objectAtIndex:theRow];
    }
    
    self.hidesBottomBarWhenPushed = YES;
    [[self navigationController] pushViewController:detalheViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchDisplayDelegate
- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller{
    [[self produtosTableView] reloadData];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self handleSearchForTerm:searchString];
    return YES;
}

#pragma mark - View LifeCycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Produtos", @"Produtos");
        self.tabBarItem.image = [UIImage imageNamed:@"produtos.png"];
    }
    return self;
}

- (void)viewDidLoad{    
    [super viewDidLoad];
    
    NSString *pathProdutos = [[NSBundle mainBundle] pathForResource:@"produto" ofType:@"plist"];
    produtosArray = [[NSArray alloc] initWithContentsOfFile:pathProdutos];
    
    NSString *pathDescricoesDosProdutos = [[NSBundle mainBundle] pathForResource:@"descricaoDosProdutos" ofType:@"plist"];
    descricoesProdutosArray = [[NSArray alloc] initWithContentsOfFile:pathDescricoesDosProdutos];
    
    NSMutableArray *contents = [[NSMutableArray alloc] initWithArray:produtosArray];
    [self setListaProdutos:contents];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload{
    [super viewDidUnload];
    produtosArray=nil;
    _produtosTableView=nil;
    listaProdutos=nil;
    resultadosBusca=nil;
    savedSearchTerms=nil;
}


@end
