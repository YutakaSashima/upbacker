//
//  FirstViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "FirstViewController.h"
#import "MyAnnotation.h"
#import "MapManager.h"
#import "MapPoint.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // マップにユーザの現在地を表示
    self.map.showsUserLocation = YES;
    // マップの中心地がユーザの現在地を追従するように設定
    [self.map setUserTrackingMode:MKUserTrackingModeFollow];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.map addAnnotation;
    
    //NSArray* locations = ;
    
    /*for (Location* location in locations) {
        CLLocationCoordinate2D coordinate =
        CLLocationCoordinate2DMake(location.latitude, location.longitude);
        CustomAnnotation* pin =
        [[CustomAnnotation alloc] initWithLocationCoordinate:coordinate
                                                       title:location.title
                                                    subtitle:location.subtitle];
        
        [self.map addAnnotation:pin];
    }*/
    
    //[self.map addAnnotation];
    //[self createAnnotations];
    [self.map addAnnotations:[self createAnnotations]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)createAnnotations
{
    [[MapManager sharedManager] points];
    
    NSArray* points = [MapManager sharedManager].points;
    
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    /*NSNumber *latitude = 12;
    NSNumber *longitude = [row objectForKey:@"lon"];
    NSString *title = [row objectForKey:@"title"];
    */
     //Create coordinates from the latitude and longitude values
    for (int i = 0; i < points.count; i++) {
        NSLog(@"test");
        MapPoint *temp = points[i];
        NSLog(@"%d v = %@ lat:%f lon:%f", i, temp.name,temp.latitude,temp.longitude);
        
        CLLocationCoordinate2D coord;
        coord.latitude = temp.latitude;
        coord.longitude = temp.longitude;
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:temp.name AndCoordinate:coord];
        [annotations addObject:annotation];
    }
    
    /*CLLocationCoordinate2D coord;
    coord.latitude = 48.58;
    coord.longitude = 2.27;
    MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:@"パリ" AndCoordinate:coord];
    [annotations addObject:annotation];*/
    
    return annotations;

    
    /*NSMutableArray *annotations = [[NSMutableArray alloc] init];
    //Read locations details from plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"plist"];
    NSArray *locations = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *row in locations) {
        NSNumber *latitude = [row objectForKey:@"lat"];
        NSNumber *longitude = [row objectForKey:@"lon"];
        NSString *title = [row objectForKey:@"title"];
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = latitude.doubleValue;
        coord.longitude = longitude.doubleValue;
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:title AndCoordinate:coord];
        [annotations addObject:annotation];
    }
    return annotations;*/
}

@end
