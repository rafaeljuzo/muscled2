//
//  BuscarViewController.m
//  Muscled2
//
//  Created by tecportal on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BuscarViewController.h"
#import "MyAnnotation.h"
#import "LojaRepresentante.h"
#import "LojaPerfilViewController.h"    

@interface BuscarViewController ()
@property (nonatomic, strong) MKUserLocation *userLocation;
@property (nonatomic, strong) NSArray * lojas;
@property (nonatomic, strong) NSMutableArray * lojaLocation;
@end

@implementation BuscarViewController

@synthesize lojas;
@synthesize placesTableView, mapView, locationManager, placesList;
@synthesize searchBar = _searchBar;
@synthesize userLocation = _userLocation;

- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    BuscarManager * arrayOfStores = [[BuscarManager alloc] init];
    self.lojas = [arrayOfStores getAllStores];
    for (LojaRepresentante *loja in self.lojas){
        [self.mapView addAnnotation:loja];
    }
}

- (void) getUserAuthorization{
    
}


#pragma mark - NSUserNotification
- (void) getLocalNotification: (LojaRepresentante *) store
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate * dateToFire = [NSDate date];
    notification.fireDate = dateToFire;
    [notification setAlertAction:@"Muscled2 Store around"];
    [notification setAlertBody:@"Do you want to trace a route to the store?"];
    
}


#pragma mark - MAPKIT delegate
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    if(annotationView)
        return annotationView;
    else
    {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                         reuseIdentifier:AnnotationIdentifier];
        
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"ann_store"];
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [annotationView setRightCalloutAccessoryView:rightButton];
        annotationView.canShowCallout = YES;
        annotationView.draggable = YES;
        return annotationView;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    LojaRepresentante *loja = (LojaRepresentante *) view.annotation;
    LojaPerfilViewController * lojaPerfilVC = [[LojaPerfilViewController alloc] init];
    lojaPerfilVC.loja = loja;
    [self.navigationController pushViewController:lojaPerfilVC animated:YES];
    
}

- (IBAction)centerUserLocation:(MKUserLocation *)sender
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 500, 500);
    [self.mapView setRegion:viewRegion animated:YES];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    if (!self.userLocation)
//        self.userLocation = [[MKUserLocation alloc] init];
//    
//    self.userLocation = userLocation;
//    
//    CLLocation * actualUserLocation = [[CLLocation alloc] initWithLatitude:userLocation.coordinate.latitude
//                                                           longitude:userLocation.coordinate.longitude];
//    
//    
//    for (LojaRepresentante *loja in self.lojas){
//        CLLocation * location = [[CLLocation alloc] initWithLatitude:loja.coordinate.latitude longitude:loja.coordinate.longitude];
//       double distance = [location distanceFromLocation:actualUserLocation];
//        distance = distance/1000;
//        if (distance < 1){
//            [self getLocalNotification:loja];
//        }
//    }
//    
    
    
    
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

@end