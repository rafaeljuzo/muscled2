//
//  BuscarViewController.m
//  Muscled2
//
//  Created by tecportal on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BuscarViewController.h"
#import "MyAnnotation.h"
#import "PlaceProfileVC.h"

@interface BuscarViewController ()
@property (nonatomic, retain) CLLocation *userLocation;
@property (nonatomic, retain) NSMutableArray * lojas;
@end

@implementation BuscarViewController

@synthesize lojas;
@synthesize placesTableView, mapView, locationManager, placeProfileVC, placesList;
@synthesize searchBar = _searchBar;
@synthesize userLocation = _userLocation;

#pragma mark - MAPKIT delegate

-(void)viewDidDisappear:(BOOL)animated
{
    self.lojas = nil;
    self.placeProfileVC = nil;
    self.placesTableView = nil;
    self.mapView = nil;
    self.placesList = nil;
    self.userLocation = nil;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    MKPinAnnotationView *annov = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"Current location"];
    annov.animatesDrop = TRUE;
    annov.canShowCallout = YES;
    [annov setPinColor:MKPinAnnotationColorGreen];
    return annov;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = self.userLocation.coordinate.latitude;
    span.longitudeDelta = self.userLocation.coordinate.longitude;
    CLLocationCoordinate2D location;
    location.latitude = userLocation.coordinate.latitude;
    location.longitude = userLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [self.mapView setRegion:region animated:YES];
}


- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    
}


#pragma mark - CLUserLocation 

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
}

#pragma UITableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 0;
}

#pragma mark View Delegate
- (IBAction)trocaMapaLista:(id)sender{
    
}
- (IBAction)centerUserLocation:(id)sender{
    
}

@end