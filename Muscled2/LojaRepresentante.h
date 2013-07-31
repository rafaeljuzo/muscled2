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
	NSString *title;
	NSString *telefone;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *telefone;
//@property (nonatomic, strong) NSString *endereco;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) CLLocationDistance radius;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
