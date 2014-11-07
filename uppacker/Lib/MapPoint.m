//
//  MapPoint.m
//  Sample
//
//  Created by Matsumura Katsuhiro on 2014/11/03.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

- (id)initWithName : (NSString *)name latitude:(double )latitude longitude:(double)longitude
{
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

//2点の距離(m)を返す
-(CLLocationDistance)getDistance:(double )latitude longitude:(double)longitude
{
    CLLocation *A = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
    CLLocation *B = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    CLLocationDistance distance = [A distanceFromLocation:B];
    
    return distance;
}

//2点の距離(m)を返す
-(CLLocationDistance)getDistanceMapPoint:(MapPoint*)targetpos
{
    CLLocation *A = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
    CLLocation *B = [[CLLocation alloc] initWithLatitude:targetpos.latitude longitude:targetpos.longitude];
    CLLocationDistance distance = [A distanceFromLocation:B];
    
    return distance;
}

@end
