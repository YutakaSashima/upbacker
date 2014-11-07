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
    self.map.showsUserLocation = YES;
    // マップの中心地がユーザの現在地を追従するように設定
    //[self.map setUserTrackingMode:MKUserTrackingModeFollow];
    // Do any additional setup after loading the view, typically from a nib.
    
    //自分でメッセージ受けるように設定
    [self.map setDelegate:self];
    
    //初期の配置
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
    
    
    NSArray* points = [MapManager sharedManager].points;
    [[MapManager sharedManager] setStartPoint:[points objectAtIndex:0]];
    [[MapManager sharedManager] setGoalPoint:[points objectAtIndex:1]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ピンを配置する
- (NSMutableArray *)createAnnotations
{
    //ピンの位置を取得する
    NSArray* points = [MapManager sharedManager].points;
    
    //返すデータ置き場
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    //取得データを配列に入れる
    for (int i = 0; i < points.count; i++) {
        MapPoint *temp = points[i];
        //NSLog(@"%d v = %@ lat:%f lon:%f", i, temp.name,temp.latitude,temp.longitude);
        
        CLLocationCoordinate2D coord;
        coord.latitude = temp.latitude;
        coord.longitude = temp.longitude;
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:temp.name AndCoordinate:coord];
        [annotations addObject:annotation];
    }
    
    
    return annotations;
}

//ピンがタップされた時の処理
- (void) mapView:(MKMapView*)_mapView
  annotationView:(MKAnnotationView*)annotationView
calloutAccessoryControlTapped:(UIControl*)control {

    //詳細画面の表示
    //[self DispDetailView];
    //詳細ビューにデータを追加する
    //[detailController setPinInfo:self.mymapView annotationView:annotationView viewController:self];
    
    
    //StoryBoradの詳細ビューコントローラとってきてモーダルビュー表示を行う
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailScene"];
    
    ////選択されたピンIDを保存する。
    MyAnnotation *test;
    test = annotationView.annotation;
    NSLog(@"pinid:%@",test.title);
    [detailViewController setCity:test.title];

    /*if([test.title isEqualToString:@"パリ"]){
        [detailViewController setCity:@"パリ"];
    }
    else if([test.title isEqualToString:@"バルセロナ"]){
        [detailViewController setCity:@"バルセロナ"];
    }
    else if([test.title isEqualToString:@"ミラノ"]){
        [detailViewController setCity:@"ミラノ"];
    }
    else if([test.title isEqualToString:@"ミュンヘン"]){
        [detailViewController setCity:@"ミュンヘン"];
    }
    else if([test.title isEqualToString:@"アムステルダム"]){
        [detailViewController setCity:@"アムステルダム"];
    }
    else if([test.title isEqualToString:@"ローマ"]){
        [detailViewController setCity:@"ローマ"];
    }
    else{
        NSLog(@"バグ");
    }*/
    
    
    

    [self presentModalViewController:detailViewController animated:YES];
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
