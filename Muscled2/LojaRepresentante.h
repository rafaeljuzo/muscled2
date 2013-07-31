//
//  LojaRepresentante.h
//  Muscled2
//
//  Created by Rafael Oda on 7/22/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LojaRepresentante : NSObject <MKAnnotation> {
    
	CLLocationCoordinate2D coordinate;
    CLLocationDistance radius;
    CLLocationManager *location;
	NSString *nome;
	NSString *telefone;
    NSString *endereco;
}

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *telefone;
@property (nonatomic, strong) NSString *endereco;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) CLLocationDistance radius;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
