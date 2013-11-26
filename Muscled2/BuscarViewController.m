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
@property (nonatomic) BOOL didStartMonitoringRegion;
@end

@implementation BuscarViewController

@synthesize lojas;
@synthesize mapView, locationManager, placesList;
@synthesize userLocation = _userLocation;
@synthesize title, subtitle;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialize Location Manager
    self.locationManager = [[CLLocationManager alloc] init];
    // Configure Location Manager
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    // Load Geofences
    //self.lojas = [NSMutableArray arrayWithArray:[[self.locationManager monitoredRegions] allObjects]];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    BuscarManager * arrayOfStores = [[BuscarManager alloc] init];
    self.lojas = [arrayOfStores getAllStores];
    for (LojaRepresentante *loja in self.lojas){
        [self.mapView addAnnotation:loja];
        
    }
}

-(void) viewDidAppear:(BOOL)animated   {
    [super viewDidAppear:YES];
    [self startStandardUpdates];
}



-(void) updateLocations{
        // Update Helper
        self.locationManager.delegate = self;
        NSMutableArray *lojasMaisProximas = [[NSMutableArray alloc] init];
        for (LojaRepresentante *loja in self.lojas){
            CLLocation * location = [[CLLocation alloc] initWithLatitude:loja.coordinate.latitude longitude:loja.coordinate.longitude];
            double distance = [location distanceFromLocation:self.locationManager.location];
            loja.distance = distance;
            [lojasMaisProximas addObject:loja];
        }
    
    // Check the authorization status
    if (([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized) &&
        ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusNotDetermined)){
        
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                     message:@"Não foi possível gravar as regiões no mapa"
                                                    delegate:nil
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil, nil];
        [av show];
    
    }else if ([CLLocationManager regionMonitoringAvailable]){
        
        if ([self.locationManager.monitoredRegions count] > 0) {
            for (id obj in self.locationManager.monitoredRegions)
                [self.locationManager stopMonitoringForRegion:obj];
        }
        
        NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES];
        [lojasMaisProximas sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
        for (LojaRepresentante *loja in lojasMaisProximas){
            CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:[loja coordinate] radius:250.0 identifier:[[NSUUID UUID] UUIDString]];
            
            
            
            // Start Monitoring Region
            [self.locationManager startMonitoringForRegion:region];
            [self.locationManager stopUpdatingLocation];
        }
    }
    
    


}



- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSString *identifier =[NSString stringWithFormat:@" Você está perto da loja %@",region.identifier];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Produtos Muscled2"
                                                 message:identifier
                                                delegate:nil
                                       cancelButtonTitle:@"Traçar Rota"
                                       otherButtonTitles:nil, nil];
    [av show];
    NSLog(@"Entrou na região");

}


- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"Started monitoring %@ region", region.identifier);
}

- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
    dispatch_queue_t exampleQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(exampleQueue, ^{
        
        [self updateLocations];
        
        dispatch_queue_t queue=dispatch_get_main_queue();
        dispatch_async(queue, ^{
            
        });
    });
    
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
- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    
    MKPinAnnotationView *annotationView =
    (MKPinAnnotationView *)[sender dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]
                          initWithAnnotation:annotation
                          reuseIdentifier:identifier];
    } else {
        annotationView.annotation = annotation;
    }
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    
    // Create a UIButton object to add on the
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton setTitle:annotation.title forState:UIControlStateHighlighted];
    [annotationView setRightCalloutAccessoryView:rightButton];
    
    return annotationView;
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    view.enabled = YES;
    view.canShowCallout = YES;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    view.userInteractionEnabled = NO;

}




-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    LojaRepresentante *loja = (LojaRepresentante *) view.annotation;
    LojaPerfilViewController * lojaPerfilVC = [[LojaPerfilViewController alloc] init];
    lojaPerfilVC.loja = loja;
    [self.navigationController pushViewController:lojaPerfilVC animated:YES];
    NSLog(@"clicou a loja %@", loja.title);
    
}

- (IBAction)centerUserLocation:(MKUserLocation *)sender
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 500, 500);
    [self.mapView setRegion:viewRegion animated:YES];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
}
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    
}

#pragma mark - CLUserLocation 

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
}




#pragma mark View Delegate
- (IBAction)trocaMapaLista:(id)sender{
    
}

- (void) createAlertViewWithMessage:(NSString* ) message{
    
    UIAlertView * alert = [[UIAlertView alloc ]initWithTitle:@"teste"
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"Descartar"
                                           otherButtonTitles:nil, nil];
    [alert show];
    
}

@end