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
@property (nonatomic, strong) NSMutableArray* points;

// アプリ内に存在するミッションのリスト
@property (nonatomic, strong) NSMutableArray* missions;

// 訪問したことのある都市のリスト
@property (nonatomic, strong) NSMutableArray* visitPoints;

// 達成したミッションのリスト
@property (nonatomic, strong) NSMutableArray* clearMissions;

// スタート都市
@property (nonatomic, strong) MapPoint* startPoint;
// ゴール都市
@property (nonatomic, strong) MapPoint* goalPoint;
// 移動距離（実世界）[m]
@property double totalMoveDistanceInReal;
// 移動距離（アプリ内世界）[m]
@property double totalMoveDistanceInApp;
// 現在の緯度経度
@property double currentLatitude;
@property double currentLongitude;

// 歩数
@property int walkCount;

// 目的地まで何割進んだか。0.0〜1.0で返します。
@property double ratio;

//グローバルカウンタ
@property int globalCnt;

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
