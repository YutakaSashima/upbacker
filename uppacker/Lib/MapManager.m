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
    MapPoint* pt1 = [[MapPoint alloc] initWithName:@"パリ" latitude:48.58 longitude:2.27];
    MapPoint* pt2 = [[MapPoint alloc] initWithName:@"バルセロナ" latitude:41.25 longitude:2.08];
    MapPoint* pt3 = [[MapPoint alloc] initWithName:@"ミラノ" latitude:45.28 longitude:9.12];
    MapPoint* pt4 = [[MapPoint alloc] initWithName:@"ミュンヘン" latitude:48.08 longitude:11.42];
    MapPoint* pt5 = [[MapPoint alloc] initWithName:@"アムステルダム" latitude:52.21 longitude:4.54];
    MapPoint* pt6 = [[MapPoint alloc] initWithName:@"ローマ" latitude:41.48 longitude:12.14];
    [self.points addObject:pt1];
    [self.points addObject:pt2];
    [self.points addObject:pt3];
    [self.points addObject:pt4];
    [self.points addObject:pt5];
    [self.points addObject:pt6];
    
    // ミッションの初期化
    self.missions = [NSMutableArray array];
    MapMission* m1 = [[MapMission alloc] initWithName:@"イタリア制覇" points:[NSArray arrayWithObjects:pt6, pt3, nil]];
    MapMission* m2 = [[MapMission alloc] initWithName:@"5か国制覇" points:[NSArray arrayWithObjects:pt1, pt2, pt3, pt4, pt5, nil]];
    MapMission* m3 = [[MapMission alloc] initWithName:@"ヨーロッパ全都市制覇" points:[NSArray arrayWithObjects:pt1, pt2, pt3, pt4, pt5, pt6, nil]];
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
  
  // スタート地点を訪問済みとする
  if (![_visitPoints containsObject:point]) {
    [_visitPoints addObject:point];
  }
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
  double totalDistMeter = [_startPoint getDistanceMapPoint:_goalPoint];
  
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
      for (int i=0; i<[_missions count]; i++) {
        MapMission* mission = [_missions objectAtIndex:i];
        if ([_clearMissions containsObject:mission]) {
          // すでにクリア済みです
        } else {
          
          // ミッションに含む全ての都市を訪問したかチェック
          BOOL allVisit = YES;
          for (int j=0; j<[mission.points count]; j++) {
            MapPoint* pt = [mission.points objectAtIndex:j];
            if (![_visitPoints containsObject:pt]) {
              allVisit = NO;
              break;
            }
          }
          
          // 達成
          if (allVisit) {
            [_clearMissions addObject:mission];
          }
        }
      }
      
    }
    
  } else if (ratio < 0.0) {
    ratio = 0.0;
  }
  
  _currentLatitude = _startPoint.latitude + (_goalPoint.latitude - _startPoint.latitude) * ratio;
  _currentLongitude = _startPoint.longitude + (_goalPoint.longitude - _startPoint.longitude) * ratio;
}

@end