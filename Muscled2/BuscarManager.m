//
//  BuscarManager.m
//  Muscled2
//
//  Created by Rafael Oda on 7/22/13.
//
//

#import "BuscarManager.h"

@implementation BuscarManager


- (NSMutableArray *)lojasCadastradas
{
    if (!_lojasCadastradas) _lojasCadastradas = [[NSMutableArray alloc]init];
    return _lojasCadastradas;
}

- (CLLocationCoordinate2D) getStoreByName:(NSString*)name
{
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 0;
    coordinate.longitude = 0;
    return coordinate;
}

- (NSArray *) getAllStores
{
    NSString *urlAddress = @"http://muscled2.com.br/api/result.php";
    NSURL *muscledRequestURL= [NSURL URLWithString:urlAddress];
    
    // Retrieve the results of the URL.
    NSData *data = [NSData dataWithContentsOfURL: muscledRequestURL];
    
    if (data)
        [self fetchedDataOfLocation:data];
    
    
    NSArray *stores = [[NSArray alloc] init];
    return stores;
}


- (void)fetchedDataOfLocation:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    //this is what u want =D
    NSArray *results = [json objectForKey:@"results"];
    LojaRepresentante * loja = [[LojaRepresentante alloc] init];
    
    for (NSDictionary *keys in results)
    {
        NSString *title = [keys objectForKey:@"title"];
        //NSDictionary *coordinate = [keys objectForKey:@"coordinate"];
        NSString *address = [keys objectForKey:@"address"];
        NSString *phone = [keys objectForKey:@"phone"];
        
        loja.nome = title;
        loja.endereco = address;
        loja.telefone = phone;
    
        
    }
}


@end
