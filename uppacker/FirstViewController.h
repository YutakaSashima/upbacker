//
//  FirstViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>



@interface FirstViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *map;


- (IBAction)gotoTop:(id)sender;

- (IBAction)btnbg:(id)sender;


@end

