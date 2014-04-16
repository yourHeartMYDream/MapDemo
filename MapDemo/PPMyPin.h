//
//  PPMyPin.h
//  MapDemo
//
//  Created by 宋晓伟 on 14-2-26.
//  Copyright (c) 2014年 宋晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface PPMyPin : NSObject<MKAnnotation>
-(id)initPinWithCoordinate:(CLLocationCoordinate2D)cdinate title:(NSString*)title subtitle:(NSString*)subtitle;
@end
