//
//  LojaRepresentante.h
//  Muscled2
//
//  Created by Rafael Oda on 7/22/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LojaRepresentante : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *telefone;
@property (nonatomic, strong) NSString *endereco;
@property (nonatomic, strong) NSString *coo;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
