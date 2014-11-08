//
//  DetailViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
- (IBAction)back:(id)sender;
-(void) setCity:(NSString*)city;
//選んだ街名
@property (strong, nonatomic) NSString *selectCity;
@property (strong, nonatomic) IBOutlet MKMapView *bgmap;
@property (strong, nonatomic) IBOutlet UITextView *detailtext;
@property (strong, nonatomic) IBOutlet UIButton *backout;
@property (strong, nonatomic) IBOutlet UIButton *goout;

@end
