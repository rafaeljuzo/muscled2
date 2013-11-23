//
//  BuscarManager.m
//  Muscled2
//
//  Created by Rafael Oda on 7/22/13.
//
//

#import "BuscarManager.h"
#import "AFJSONRequestOperation.h"

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
    
    NSURL *url = [NSURL URLWithString:@"http://muscled2.com.br/api/result.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Titulo: %@", [JSON valueForKeyPath:@"title"]);
        NSLog(@"Coordenadas: %@", [JSON valueForKeyPath:@"coordinate"]);
        NSLog(@"Endereço: %@", [JSON valueForKeyPath:@"address"]);
        NSLog(@"Telefone: %@", [JSON valueForKeyPath:@"phone"]);
    } failure:nil];
    
    [operation start];
    
    
    NSString *urlAddress = @"http://muscled2.com.br/api/result.php";
    NSURL *muscledRequestURL= [NSURL URLWithString:urlAddress];
    
    // Retrieve the results of the URL.
    NSData *data = [NSData dataWithContentsOfURL: muscledRequestURL];
    
    if (data)
        [self fetchedDataOfLocation:data];
    
    return self.lojasCadastradas;
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
    for (NSDictionary *keys in results)
    {
        LojaRepresentante * loja = [[LojaRepresentante alloc] init];
        NSString *title = [keys objectForKey:@"title"];
        NSString *coordinate = [keys objectForKey:@"coordinate"];
        NSString *address = [keys objectForKey:@"address"];
        NSString *phone = [keys objectForKey:@"phone"];
        NSArray *coo = [coordinate componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
         MKCoordinateRegion lojaRegion = {{ 0.0 , 0.0 } , { 0.0, 0.0 }};
        lojaRegion.center.latitude = [[coo objectAtIndex:0] doubleValue];
        lojaRegion.center.longitude = [[coo lastObject] doubleValue];
        loja.coordinate = lojaRegion.center;
        loja.title = title;
        loja.endereco = address;
        loja.telefone = phone;
        
        [self.lojasCadastradas addObject:loja];
        
    }
}


@end
