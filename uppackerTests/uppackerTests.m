//
//  uppackerTests.m
//  uppackerTests
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "MapManager.h"

@interface uppackerTests : XCTestCase

@end

@implementation uppackerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testMapManager {
  
  NSArray* points = [MapManager sharedManager].points;
  NSLog(@"city count = %d", (int)[points count]);
  
  // 0->1
  [[MapManager sharedManager] setStartPoint:[points objectAtIndex:0]];
  [[MapManager sharedManager] setGoalPoint:[points objectAtIndex:1]];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
  [[MapManager sharedManager] addMoveDistance:10000];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
  
  // 1->2
  [[MapManager sharedManager] setStartPoint:[points objectAtIndex:1]];
  [[MapManager sharedManager] setGoalPoint:[points objectAtIndex:2]];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
  [[MapManager sharedManager] addMoveDistance:10000];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
  
  // クリア済みミッションのチェック
  int missionCnt = (int)[[[MapManager sharedManager] clearMissions] count];
  NSLog(@"mission count = %d", missionCnt);
  XCTAssert(1 == missionCnt, "Mission count = 1");
}

@end
