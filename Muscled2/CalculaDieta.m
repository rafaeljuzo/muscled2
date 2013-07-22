//
//  CalculaDieta.m
//  Muscled2
//
//  Created by Douglas de Souza Ferreira on 22/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculaDieta.h"
#define CALORIAS 37.5
#define CARBOIDRATOS 5.9
#define PROTEINAS 2
#define GORDURAS 0.6

@implementation CalculaDieta

- (NSMutableArray *)calculaDietaParaPeso:(double)peso objetivo:(int)tag{
    NSMutableArray *resultadoArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    double caloriasBase, carboidratosBase, proteinasBase, gordurasBase,
        caloriasFinal, carboidratosFinal, proteinasFinal, gordurasFinal;
    
    caloriasBase = (peso * CALORIAS);
    carboidratosBase = (peso * CARBOIDRATOS);
    proteinasBase = (peso * PROTEINAS);
    gordurasBase = (peso * GORDURAS);
    
    switch (tag) {
        case 0:
            caloriasFinal = caloriasBase;
            carboidratosFinal = carboidratosBase;
            proteinasFinal = proteinasBase;
            gordurasFinal = gordurasBase;
            break;
        case 1:
            caloriasFinal = caloriasBase/0.95;
            carboidratosFinal = carboidratosBase/0.95;
            proteinasFinal = proteinasBase/0.95;
            gordurasFinal = gordurasBase/0.95;
            break;
        case 2:
            caloriasFinal = caloriasBase*0.95;
            carboidratosFinal = carboidratosBase*0.95;
            proteinasFinal = proteinasBase*0.95;
            gordurasFinal = gordurasBase*0.95;
            break;
    }
    
    [resultadoArray addObjectsFromArray: [NSArray arrayWithObjects: 
                                        [NSNumber numberWithDouble:caloriasFinal],
                                        [NSNumber numberWithDouble:carboidratosFinal],
                                        [NSNumber numberWithDouble:proteinasFinal],
                                        [NSNumber numberWithDouble:gordurasFinal],
                                        nil]];
    
    return resultadoArray;
}
@end
