//
//  FirstViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "FirstViewController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
