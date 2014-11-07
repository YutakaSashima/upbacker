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
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//戻ってきた時コールアウトを消す
- (void)viewDidAppear:(BOOL)animated
{
    NSArray *selectedAnnotations = self.map.selectedAnnotations;
    for(id annotation in selectedAnnotations) {
        [self.map deselectAnnotation:annotation animated:NO];
    }
}

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    // マップにユーザの現在地を表示
    //self.map.showsUserLocation = YES;
    // マップの中心地がユーザの現在地を追従するように設定
    //[self.map setUserTrackingMode:MKUserTrackingModeFollow];
    // Do any additional setup after loading the view, typically from a nib.
    
    //自分でメッセージ受けるように設定
    [self.map setDelegate:self];
    
    
    
    CLLocationCoordinate2D co;
    co.latitude = 41.48; // 経度
    co.longitude = 12.14; // 緯度
    [self.map setCenterCoordinate:co animated:YES];
    [self.map addAnnotations:[self createAnnotations]];
    
    // 縮尺を指定
    MKCoordinateRegion cr = self.map.region;
    cr.center = co;
    cr.span.latitudeDelta = 50;
    cr.span.longitudeDelta = 50;
    [self.map setRegion:cr animated:NO];
    
    self.map.showsUserLocation = YES;
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

/*- (void) mapView:(MKMapView*)_mapView annotationView:(MKAnnotationView*)annotationView calloutAccessoryControlTapped:(UIControl*)control {
    // タップしたときの処理
    // annotationView.annotation でどのアノテーションか判定可能
    
    NSLog(@"Test");
}*/

//ピンがタップされた時の処理
- (void) mapView:(MKMapView*)_mapView
  annotationView:(MKAnnotationView*)annotationView
calloutAccessoryControlTapped:(UIControl*)control {
    //詳細画面の表示
    //[self DispDetailView];
    //詳細ビューにデータを追加する
    //[detailController setPinInfo:self.mymapView annotationView:annotationView viewController:self];
    
    ////選択されたピンIDを保存する。
    //SoundPlayPos *test;
    //test = annotationView.annotation;
    //NSLog(@"pinid:%@",test.identifier);
    //deletepinID = test.identifier;
    
    NSLog(@"Test");
    
    //[self performSegueWithIdentifier:@"presentDetailView" sender:self];
    
    // FirstScene と SecondScene が同じ Storyboard にある場合
    DetailViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailScene"];
    
    [self presentModalViewController:secondViewController animated:YES];
}

//ピンを配置するときに呼び出される処理
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)
    [mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if(pinView == nil){
        pinView = [[MKPinAnnotationView alloc]
                    initWithAnnotation:annotation reuseIdentifier:@"pin"];
    }
    
    //配置するピンの設定
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pinView.annotation = annotation;
    
    
    
    
    return pinView;
    
}

@end
