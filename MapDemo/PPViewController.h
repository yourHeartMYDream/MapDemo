//
//  PPViewController.h
//  MapDemo
//
//  Created by 宋晓伟 on 14-2-26.
//  Copyright (c) 2014年 宋晓伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface PPViewController : UIViewController<CLLocationManagerDelegate>
@property(weak,nonatomic)IBOutlet MKMapView*mapview;
@end
