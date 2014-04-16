//
//  PPViewController.m
//  MapDemo
//
//  Created by 宋晓伟 on 14-2-26.
//  Copyright (c) 2014年 宋晓伟. All rights reserved.
//

#import "PPViewController.h"
#import "PPMyPin.h"
@interface PPViewController ()
@property(strong,nonatomic)CLLocationManager*locationManager;
@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.locationManager=[[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"location can not service!");
    }else{
        self.locationManager.delegate=self;
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ulity
-(void)MethodForSetMapviewRegionWithCoordinate:(CLLocationCoordinate2D)coordinate span:(MKCoordinateSpan)span
{
    //span --跨度
    MKCoordinateRegion region={coordinate,span};
    self.mapview.region=region;
    //蓝点位置显示
    self.mapview.showsUserLocation=YES;
}

-(void)addPinWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude=coordinate.latitude+0.0011;
    pinCoordinate.longitude=coordinate.longitude+0.0011;
    PPMyPin*pin=[[PPMyPin alloc]initPinWithCoordinate:pinCoordinate title:@"test" subtitle:@"subTest"];
    [self.mapview addAnnotation:pin];
}
#pragma mark - cllocationManager delegate
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //location fail
    NSLog(@"location fail");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //location success
    NSLog(@"location success for Locations:%@",[locations objectAtIndex:0 ] );
    CLLocation*newLocation=(CLLocation*)[locations objectAtIndex:0];
    CLLocationCoordinate2D coordinate=newLocation.coordinate;//CLLocationCoordinate2D 不是类--是结构体
    //??????没有alt？？？？？？
    NSLog(@"lat:%f--lon:%f",coordinate.latitude,coordinate.longitude);
    MKCoordinateSpan span;
    span.latitudeDelta=0.05;
    span.longitudeDelta=0.05;
    //在map中地点
    [self MethodForSetMapviewRegionWithCoordinate:coordinate span:span];
    //添加一个大头针
    [self addPinWithCoordinate:coordinate];
}

@end
