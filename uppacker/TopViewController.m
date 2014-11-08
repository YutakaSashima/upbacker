//
//  TopViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "TopViewController.h"
#import "RunViewController.h"
#import "SecondViewController.h"
#import "MapManager.h"
#import "MyAnnotation.h"
#import "MapManager.h"
#import "MapPoint.h"
#import "DetailViewController.h"


@interface TopViewController ()

@end

@implementation TopViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    //自分でメッセージ受けるように設定
    [self.map setDelegate:self];
    
    //初期の配置
    CLLocationCoordinate2D co;
    co.latitude = 48.58; // 経度
    co.longitude = 2.08; // 緯度
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
    
    //self.map.alpha = 0.2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)openRun:(id)sender {
   // NSLog(@"OpenRun");
    
    RunViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"RunView"];
    //ビューコントローラの表示
    [self presentModalViewController:run animated:YES];
}

- (IBAction)openBg:(id)sender {
    
    //SecondView
    
    SecondViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    //ビューコントローラの表示
    [self presentModalViewController:run animated:YES];

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
    
    //配置するピンの設定
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pinView.annotation = annotation;
    
    
    
    
    return pinView;
    
}

@end
