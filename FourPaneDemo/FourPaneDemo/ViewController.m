//
//  ViewController.m
//  FourPaneDemo
//
//  Created by Andrei Bogdan on 07/03/16.
//  Copyright © 2016 Andrei Bogdan. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialize web page
    NSString *webURL = @"https://www.facebook.com/smashmag";
    
    NSMutableURLRequest *request =  [NSMutableURLRequest requestWithURL: [NSURL URLWithString:webURL]];
    
    [self.webView loadRequest:request];
    
    //center the map
    //51.2289281,4.4158724
    double latitude = 51.2289281;
    double longitude = 4.4158724;
    
    MKPointAnnotation *wiclAnno = [[MKPointAnnotation alloc] init];
    wiclAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    wiclAnno.title = @"Testing";
    
    [self.mapView addAnnotation:wiclAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wiclAnno.coordinate, 10000, 10000);
    MKCoordinateRegion adjusted = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjusted animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
