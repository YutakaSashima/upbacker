//
//  MapMission.h
//  uppacker
//
//  Created by Keisuke Kobayashi on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapMission : NSObject

//名前
@property (nonatomic, strong) NSString *name;

// このミッションに必要な都市のリスト
@property (nonatomic) NSMutableArray *points;

//初期化
- (id)initWithName : (NSString *)name points:(NSMutableArray*)points;

@end
