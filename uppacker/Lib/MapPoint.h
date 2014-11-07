//
//  MapPoint.h
//  Sample
//
//  Created by Matsumura Katsuhiro on 2014/11/03.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject
//名前
@property (nonatomic, strong) NSString *name;
//緯度
@property (nonatomic, readwrite) double latitude;
//経度
@property (nonatomic, readwrite) double longitude;

//初期化
- (id)initWithName : (NSString *)name latitude:(double )latitude longitude:(double)longitude;
//2点の距離(m)を返す
-(CLLocationDistance)getDistance:(double )latitude longitude:(double)longitude;
//2点の距離(m)を返す
-(CLLocationDistance)getDistanceMapPoint:(MapPoint*)targetpos;
@end
