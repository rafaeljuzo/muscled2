//
//  BuscarManager.h
//  Muscled2
//
//  Created by Rafael Oda on 7/22/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "LojaRepresentante.h"

@interface BuscarManager : NSObject

@property (nonatomic, strong) NSMutableArray *lojasCadastradas;

- (NSArray *) getAllStores;


@end
