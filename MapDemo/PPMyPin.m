//
//  PPMyPin.m
//  MapDemo
//
//  Created by 宋晓伟 on 14-2-26.
//  Copyright (c) 2014年 宋晓伟. All rights reserved.
//

#import "PPMyPin.h"

@implementation PPMyPin
@synthesize coordinate;
@synthesize title=_title;
@synthesize subtitle=_subtitle;
-(id)initPinWithCoordinate:(CLLocationCoordinate2D)cdinate title:(NSString*)title subtitle:(NSString*)subtitle
{
    self=[super init];
    if (self) {
        coordinate=cdinate;
        _title=title;
        _subtitle=subtitle;
    }
    return self;
}
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    coordinate=newCoordinate;
}
@end
