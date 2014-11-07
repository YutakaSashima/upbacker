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
  
  [[MapManager sharedManager] setStartPoint:[points objectAtIndex:0]];
  [[MapManager sharedManager] setGoalPoint:[points objectAtIndex:1]];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
  
  [[MapManager sharedManager] addMoveDistance:100];
  NSLog(@"lat=%f, lon=%f", [MapManager sharedManager].currentLatitude, [MapManager sharedManager].currentLongitude);
}

@end
