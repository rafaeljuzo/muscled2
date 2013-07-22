//
//  Annotation.h
//  Muscled2
//
//  Created by Juzo Oda on 27/12/11.
//  Copyright (c) 2011 Digitalbr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>{
    NSString *title;
    NSString *subtitle;
    NSString *distanceFromUser;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) MKCoordinateRegion coordinateRegion;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy)	NSString *subtitle;
@property (nonatomic, copy) NSString *distanceFromUser;

-(id)initWithRegion:(MKCoordinateRegion)coordRegion;

@end
