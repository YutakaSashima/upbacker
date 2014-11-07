//
//  MapManager.h
//  uppacker
//
//  Created by Keisuke Kobayashi on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#ifndef uppacker_MapManager_h
#define uppacker_MapManager_h

#import "MapPoint.h"

/**
 * マップマネージャ
 * 歩数を入力して現在地を更新したり、バッジを取得したりできます
 */
@interface MapManager : NSObject

// アプリ内に存在する都市のリスト
@property (nonatomic) NSMutableArray* points;

// 訪問したことのある都市のリスト
@property (nonatomic) NSMutableArray* visitPoints;

// スタート都市
@property MapPoint* startPoint;
// ゴール都市
@property MapPoint* goalPoint;
// 移動距離（実世界）[m]
@property double totalMoveDistanceInReal;
// 移動距離（アプリ内世界）[m]
@property double totalMoveDistanceInApp;
// 現在の緯度経度
@property double currentLatitude;
@property double currentLongitude;

+ (MapManager *)sharedManager;

/**
 * スタート位置を指定する
 */
- (void)setStartPoint:(MapPoint*)point;

/**
 * ゴール位置を指定する
 */
- (void)setGoalPoint:(MapPoint*)point;

/**
 * 実世界の移動距離を加算する（単位は歩数）
 */
- (void)addMoveDistance:(int)dist;


@end

#endif
