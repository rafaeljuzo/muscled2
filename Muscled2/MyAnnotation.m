//
//  Annotation.m
//  Muscled2
//
//  Created by Juzo Oda on 27/12/11.
//  Copyright (c) 2011 Digitalbr. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate = _coordinate;
@synthesize coordinateRegion = _coordinateRegion;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize distanceFromUser = _distanceFromUser;

- (id)initWithRegion:(MKCoordinateRegion)coordRegion 
{
	if ((self = [super init])) {
		_coordinate = coordRegion.center;
		_coordinateRegion = coordRegion;        
    }
	
	return self;
}

@end
