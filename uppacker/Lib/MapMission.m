//
//  MapMission.m
//  uppacker
//
//  Created by Keisuke Kobayashi on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "MapMission.h"

@implementation MapMission

-(id)initWithName:(NSString *)name points:(NSMutableArray *)points {
  self = [super init];
  if (self != nil) {
    self.name = name;
    self.points = points;
  }
  return self;
}

@end
