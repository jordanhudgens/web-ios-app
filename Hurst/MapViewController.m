//
//  MapViewController.m
//  Hurst
//
//  Created by Jordan Hudgens on 7/19/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Abernathy location setup
    CLLocationCoordinate2D abernathyLocation;
    abernathyLocation.latitude = 33.824954;
    abernathyLocation.longitude = -101.843572;
    MKPointAnnotation *abernathyPoint = [[MKPointAnnotation alloc] init];
    abernathyPoint.coordinate = abernathyLocation;
    abernathyPoint.title = @"HFS - Abernathy";
    abernathyPoint.subtitle = @"105 Ave D, Abernathy, TX 79311, Phone: (800) 535-8903";
    
    // Lubbock location setup 33.628161,-101.915645
    CLLocationCoordinate2D lubbockLocation;
    lubbockLocation.latitude = 33.628161;
    lubbockLocation.longitude = -101.915645;
    MKPointAnnotation *lubbockPoint = [[MKPointAnnotation alloc] init];
    lubbockPoint.coordinate = lubbockLocation;
    lubbockPoint.title = @"HFS - Lubbock";
    lubbockPoint.subtitle = @"4801 Hwy 84, Lubbock, TX 79416, Phone: (800) 873-1427";
    
    
    // Lorenzo location setup 33.6662865,-101.5285284
    CLLocationCoordinate2D lorenzoLocation;
    lorenzoLocation.latitude = 33.6662865;
    lorenzoLocation.longitude = -101.5285284;
    MKPointAnnotation *lorenzoPoint = [[MKPointAnnotation alloc] init];
    lorenzoPoint.coordinate = lorenzoLocation;
    lorenzoPoint.title = @"HFS - Lorenzo";
    lorenzoPoint.subtitle = @"Highway 82 East, Lorenzo, TX 79343, Phone: (800) 477-5617";
    
    // Colorado City location setup 32.41465,-100.860353
    CLLocationCoordinate2D coloradoCityLocation;
    coloradoCityLocation.latitude = 32.41465;
    coloradoCityLocation.longitude = -100.860353;
    MKPointAnnotation *coloradoCityPoint = [[MKPointAnnotation alloc] init];
    coloradoCityPoint.coordinate = coloradoCityLocation;
    coloradoCityPoint.title = @"HFS - Colorado City";
    coloradoCityPoint.subtitle = @"2305 N State Highway 208, Colorado City, TX 79512, Phone: (855) 400-2260";
    
    // Crosbyton location setup 32.41465,-100.860353
    CLLocationCoordinate2D crosbytonLocation;
    crosbytonLocation.latitude = 32.41465;
    crosbytonLocation.longitude = -100.860353;
    MKPointAnnotation *crosbytonPoint = [[MKPointAnnotation alloc] init];
    crosbytonPoint.coordinate = crosbytonLocation;
    crosbytonPoint.title = @"HFS - Crosbyton";
    crosbytonPoint.subtitle = @"2102 E Hwy 82, Crosbyton, TX 79322, Phone: (800) 765.8972";
    
    // Slaton location setup 33.4489399,-101.6574352
    CLLocationCoordinate2D slatonLocation;
    slatonLocation.latitude = 33.4489399;
    slatonLocation.longitude = -101.6574352;
    MKPointAnnotation *slatonPoint = [[MKPointAnnotation alloc] init];
    slatonPoint.coordinate = slatonLocation;
    slatonPoint.title = @"HFS - Slaton";
    slatonPoint.subtitle = @"1150 N 20th Street, Slaton, TX 79364, Phone: (800) 999-9851";
    
    // Snyder location setup 32.7092618,-100.8885045
    CLLocationCoordinate2D snyderLocation;
    snyderLocation.latitude = 32.7092618;
    snyderLocation.longitude = -100.8885045;
    MKPointAnnotation *snyderPoint = [[MKPointAnnotation alloc] init];
    snyderPoint.coordinate = snyderLocation;
    snyderPoint.title = @"HFS - Snyder";
    snyderPoint.subtitle = @"507 East Coliseum Drive, Snyder, TX 79549, Phone: (855) 573-3201";
    
    // Render the locations on the map
    [self.mapView addAnnotation:abernathyPoint];
    [self.mapView addAnnotation:lubbockPoint];
    [self.mapView addAnnotation:lorenzoPoint];
    [self.mapView addAnnotation:coloradoCityPoint];
    [self.mapView addAnnotation:crosbytonPoint];
    [self.mapView addAnnotation:slatonPoint];
    [self.mapView addAnnotation:snyderPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
