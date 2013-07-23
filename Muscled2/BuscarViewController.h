//
//  BuscarViewController.h
//  Muscled2
//
//  Created by tecportal on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PlaceProfileVC.h"
#import "MyAnnotation.h"
#import "BuscarManager.h"

@interface BuscarViewController : UIViewController< MKMapViewDelegate,
                                                    CLLocationManagerDelegate,
                                                    MKAnnotation
                                                    >
{
    IBOutlet MKMapView *mapView;
    IBOutlet UITableView *placesTableView;
    IBOutlet PlaceProfileVC *placeProfileVC;
    IBOutlet UISearchBar *searchBar;
    IBOutlet UIBarButtonItem *userCurrentLocationButton;
    
    CLLocationManager *locationManager;
    NSMutableArray *placesList;
}

@property (strong, nonatomic) IBOutlet UITableView *placesTableView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet PlaceProfileVC *placeProfileVC;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *placesList;

- (IBAction)trocaMapaLista:(id)sender;
- (IBAction)centerUserLocation:(id)sender;

@end

