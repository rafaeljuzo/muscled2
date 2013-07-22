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

@interface BuscarViewController : UIViewController< MKMapViewDelegate,
                                                    CLLocationManagerDelegate,
                                                    UITableViewDelegate,
                                                    UITableViewDataSource
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

@property (retain, nonatomic) IBOutlet UITableView *placesTableView;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet PlaceProfileVC *placeProfileVC;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSMutableArray *placesList;

- (IBAction)trocaMapaLista:(id)sender;
- (IBAction)centerUserLocation:(id)sender;

@end

