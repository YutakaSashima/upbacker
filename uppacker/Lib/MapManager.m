//
//  MapManager.m
//  uppacker
//
//  Created by Keisuke Kobayashi on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapManager.h"
#import "MapMission.h"

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
    
    // 都市の初期化
    self.points = [NSMutableArray array];
    MapPoint* pt1 = [[MapPoint alloc] initWithName:@"City 1" latitude:36.0 longitude:115.0];
    MapPoint* pt2 = [[MapPoint alloc] initWithName:@"City 2" latitude:51.0 longitude:0.0];
    MapPoint* pt3 = [[MapPoint alloc] initWithName:@"City 3" latitude:41.0 longitude:12.0];
    MapPoint* pt4 = [[MapPoint alloc] initWithName:@"City 4" latitude:41.0 longitude:2.0];
    MapPoint* pt5 = [[MapPoint alloc] initWithName:@"City 5" latitude:55.0 longitude:37.0];
    [self.points addObject:pt1];
    [self.points addObject:pt2];
    [self.points addObject:pt3];
    [self.points addObject:pt4];
    [self.points addObject:pt5];
    
    // ミッションの初期化
    self.missions = [NSMutableArray array];
    MapMission* m1 = [[MapMission alloc] initWithName:@"Mission Name 1" points:[NSArray arrayWithObjects:pt1, pt2, pt3, nil]];
    MapMission* m2 = [[MapMission alloc] initWithName:@"Mission Name 2" points:[NSArray arrayWithObjects:pt1, pt2, pt3, nil]];
    MapMission* m3 = [[MapMission alloc] initWithName:@"Mission Name 3" points:[NSArray arrayWithObjects:pt1, pt2, pt3, nil]];
    [self.missions addObject:m1];
    [self.missions addObject:m2];
    [self.missions addObject:m3];
    
    self.visitPoints = [NSMutableArray array];
    
    self.clearMissions = [NSMutableArray array];
    
    self.totalMoveDistanceInApp = 0.0;
    self.totalMoveDistanceInReal = 0.0;
    
    self.currentLatitude = 0.0;
    self.currentLongitude = 0.0;
  }
  return self;
}

-(void)setStartPoint:(MapPoint *)point {
  _startPoint = point;
  _currentLatitude = point.latitude;
  _currentLongitude = point.longitude;
  _totalMoveDistanceInApp = 0.0;
  _totalMoveDistanceInApp = 0.0;
}

-(void)setGoalPoint:(MapPoint *)point {
  _goalPoint = point;
}

-(void)addMoveDistance:(int)dist {
  
  // 1歩 = 70m換算
  double meter = dist * 70.0;
  
  _totalMoveDistanceInReal += meter;
  _totalMoveDistanceInApp += meter * 100; // TODO とりあえずApp内では100倍しとく
  
  // start-goal間距離
  double totalDistMeter = [self.startPoint getDistanceMapPoint:self.goalPoint];
  
  // どれだけ進んだか（0.0...1.0）
  double ratio = _totalMoveDistanceInApp / totalDistMeter;
  if (ratio > 1.0) {
    ratio = 1.0;
    
    // 訪問達成！
    if ([_visitPoints containsObject:_goalPoint]) {
      // 過去に訪問済み
    } else {
      [_visitPoints addObject:_goalPoint];
      
      // ミッション達成チェック
      
      
    }
    
  } else if (ratio < 0.0) {
    ratio = 0.0;
  }
  
  _currentLatitude = _startPoint.latitude + (_goalPoint.latitude - _startPoint.latitude) * ratio;
  _currentLongitude = _startPoint.longitude + (_goalPoint.longitude - _startPoint.longitude) * ratio;
}

@end