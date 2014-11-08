//
//  TopViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TopViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
- (IBAction)openRun:(id)sender;
- (IBAction)openBg:(id)sender;

@property (strong, nonatomic) IBOutlet MKMapView *map;

@end
