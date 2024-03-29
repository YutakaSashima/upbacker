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
#import "RunViewController.h"
#import "SecondViewController.h"

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
    cr.span.latitudeDelta = 40;
    cr.span.longitudeDelta = 40;
    [self.map setRegion:cr animated:NO];
    
    self.map.showsUserLocation = YES;
    
    
    //NSArray* points = [MapManager sharedManager].points;
    //[[MapManager sharedManager] setStartPoint:[points objectAtIndex:0]];
    //[[MapManager sharedManager] setGoalPoint:[points objectAtIndex:1]];
    
    UIImage *imgs = [UIImage imageNamed:@"ftop2"];
    [self.topbtnout setBackgroundImage:imgs forState:UIControlStateNormal];
    
    UIImage *imgs2 = [UIImage imageNamed:@"fmap2"];
    [self.mapbtnout setBackgroundImage:imgs2 forState:UIControlStateNormal];
    
    UIImage *imgs3 = [UIImage imageNamed:@"fbadge2"];
    [self.bgbtnout setBackgroundImage:imgs3 forState:UIControlStateNormal];
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

    //StoryBoradにある詳細ビューコントローラとって来る
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailScene"];
    
    //選択ピンのタイトル取得してビューコントローラに設置
    MyAnnotation *test;
    test = annotationView.annotation;
    [detailViewController setCity:test.title];

    //ビューコントローラの表示
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
    
    MyAnnotation *temp = annotation;
    if( [temp.title isEqualToString:@"パリ"]){
        //return nil;
        
        
        MKAnnotationView *annotationView;
        // ②再利用可能なannotationがあるかどうかを判断するための識別子を定義
        NSString* identifier = @"Pin";
        // ③dequeueReusableAnnotationViewWithIdentifierで"Pin"という識別子の使いまわせるannotationがあるかチェック
        annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        // ④使い回しができるannotationがない場合、annotationの初期化
        if(annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        // ⑤好きな画像をannotationとして設定
        annotationView.image = [UIImage imageNamed:@"human_mini.png"];
        annotationView.annotation = annotation;
        return annotationView;
    }
    else{
        //配置するピンの設定
        pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.annotation = annotation;
        return pinView;
        
    }
    
    //配置するピンの設定
    /*pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pinView.annotation = annotation;*/
    //return pinView;
    
   /* UIImage *imgs = [UIImage imageNamed:@"home_b"];
    [self.topbtnout setBackgroundImage:imgs forState:UIControlStateNormal];
    
    UIImage *imgs2 = [UIImage imageNamed:@"map_b"];
    [self.mapbtnout setBackgroundImage:imgs2 forState:UIControlStateNormal];
    
    UIImage *imgs3 = [UIImage imageNamed:@"badge_b"];
    [self.badgebtnout setBackgroundImage:imgs3 forState:UIControlStateNormal];*/
    
    

}

- (IBAction)gotoTop:(id)sender {
    
    RunViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"RunView"];
    //ビューコントローラの表示
    //[self presentModalViewController:run animated:NO];
    [self presentViewController:run animated:NO completion:nil];
    
    
}

- (IBAction)btnbg:(id)sender {
    
    //SecondView
    
    SecondViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    //ビューコントローラの表示
    //[self presentModalViewController:run animated:NO];

    [self presentViewController:run animated:NO completion:nil];
    
}
@end
