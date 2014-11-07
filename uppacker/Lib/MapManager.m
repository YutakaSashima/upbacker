//
//  MapManager.m
//  uppacker
//
//  Created by Keisuke Kobayashi on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapManager.h"

@implementation MapManager

static MapManager *sharedData_ = nil;

+ (MapManager *)sharedManager{
  if (!sharedData_) {
    sharedData_ = [MapManager new];
  }
  return sharedData_;
}

- (id)init
{
  self = [super init];
  if (self) {
    //Initialization
    
    self.points = [NSMutableArray array];
    [self.points addObject:[[MapPoint alloc] initWithName:@"Tokyo" latitude:0.0 longitude:0.0]];
    [self.points addObject:[[MapPoint alloc] initWithName:@"London" latitude:1.0 longitude:1.0]];
    [self.points addObject:[[MapPoint alloc] initWithName:@"Paris" latitude:2.0 longitude:2.0]];
    [self.points addObject:[[MapPoint alloc] initWithName:@"Hong-Kong" latitude:3.0 longitude:3.0]];
    [self.points addObject:[[MapPoint alloc] initWithName:@"Moscow" latitude:4.0 longitude:4.0]];
    
    self.visitPoints = [NSMutableArray array];
    
    self.totalMoveDistanceInApp = 0.0;
    self.totalMoveDistanceInReal = 0.0;
    
    self.currentLatitude = 0.0;
    self.currentLongitude = 0.0;
  }
  return self;
}

-(void)setStartPoint:(MapPoint *)point {
  self.startPoint = point;
  self.currentLatitude = point.latitude;
  self.currentLongitude = point.longitude;
  self.totalMoveDistanceInApp = 0.0;
  self.totalMoveDistanceInApp = 0.0;
}

-(void)setGoalPoint:(MapPoint *)point {
  self.goalPoint = point;
}

-(void)addMoveDistance:(int)dist {
  
  // 1歩 = 70m換算
  double meter = dist * 70.0;
  
  self.totalMoveDistanceInReal += meter;
  self.totalMoveDistanceInApp += meter * 100; // TODO とりあえずApp内では100倍しとく
  
  // start-goal間距離
  double totalDistMeter = [self.startPoint getDistanceMapPoint:self.goalPoint];
  
  // どれだけ進んだか（0.0...1.0）
  double ratio = self.totalMoveDistanceInApp / totalDistMeter;
  if (ratio > 1.0) {
    ratio = 1.0;
    
    // 訪問達成！
    if ([self.visitPoints containsObject:self.goalPoint]) {
      // 過去に訪問済み
    } else {
      [self.visitPoints addObject:self.goalPoint];
    }
    
  } else if (ratio < 0.0) {
    ratio = 0.0;
  }
  
  self.currentLatitude = self.startPoint.latitude + (self.goalPoint.latitude - self.startPoint.latitude) * ratio;
  self.currentLongitude = self.startPoint.longitude + (self.goalPoint.longitude - self.startPoint.longitude) * ratio;
}

@end