//
//  DetailViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "DetailViewController.h"
#import "MapManager.h"
#import "MyAnnotation.h"
#import "MapManager.h"
#import "MapPoint.h"
#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //自分でメッセージ受けるように設定
    [self.bgmap setDelegate:self];
    
    //初期の配置
    CLLocationCoordinate2D co;
    co.latitude = 48.58; // 経度
    co.longitude = 2.08; // 緯度
    [self.bgmap setCenterCoordinate:co animated:YES];
    [self.bgmap addAnnotations:[self createAnnotations]];
    
    // 縮尺を指定
    MKCoordinateRegion cr = self.bgmap.region;
    cr.center = co;
    cr.span.latitudeDelta = 50;
    cr.span.longitudeDelta = 50;
    [self.bgmap setRegion:cr animated:NO];
    
    self.bgmap.showsUserLocation = YES;
    self.bgmap.alpha = 0.4;
    
    
    
    

    // Do any additional setup after loading the view.
    UIImage *img_mae;
    float widthPer = 0.2;  // リサイズ後幅の倍率
    float heightPer = 0.2;  // リサイズ後高さの倍率
    

    if([self.selectCity isEqualToString:@"パリ"]){
        NSLog(@"1");
        img_mae = [UIImage imageNamed:@"roma_photo.jpg"];  // リサイズ前UIImage
        widthPer = 0.2;  // リサイズ後幅の倍率
        heightPer = 0.2;  // リサイズ後高さの倍率
        
    }
    else if([self.selectCity  isEqualToString:@"バルセロナ"]){
        NSLog(@"2");
        img_mae = [UIImage imageNamed:@"barcelona.png"];  // リサイズ前UIImage
        widthPer = 0.7;  // リサイズ後幅の倍率
        heightPer = 0.7;  // リサイズ後高さの倍率
        
    }
    else if([self.selectCity  isEqualToString:@"ミラノ"]){
        NSLog(@"3");
        img_mae = [UIImage imageNamed:@"milano.png"];  // リサイズ前UIImage
        widthPer = 0.7;  // リサイズ後幅の倍率
        heightPer = 0.7;  // リサイズ後高さの倍率
        
    }
    else if([self.selectCity  isEqualToString:@"ミュンヘン"]){
        NSLog(@"4");
        img_mae = [UIImage imageNamed:@"munich.png"];  // リサイズ前UIImage
        widthPer = 0.7;  // リサイズ後幅の倍率
        heightPer = 0.7;  // リサイズ後高さの倍率
        
    }
    else if([self.selectCity  isEqualToString:@"アムステルダム"]){
        NSLog(@"5");
        img_mae = [UIImage imageNamed:@"amsterdam.png"];  // リサイズ前UIImage
        widthPer = 0.7;  // リサイズ後幅の倍率
        heightPer = 0.7;  // リサイズ後高さの倍率
        
    }
    else if([self.selectCity  isEqualToString:@"ローマ"]){
        NSLog(@"6");
        img_mae = [UIImage imageNamed:@"rome.png"];  // リサイズ前UIImage
        widthPer = 0.7;  // リサイズ後幅の倍率
        heightPer = 0.7;  // リサイズ後高さの倍率
        
    }
    else{
        //img_mae = [UIImage imageNamed:@"roma_photo.jpg"];  // リサイズ前UIImage
        NSLog(@"バグ");
    }
        
        
    //画像
    //UIImage *img_mae = [UIImage imageNamed:@"roma_photo.jpg"];  // リサイズ前UIImage
    UIImage *img_ato;  // リサイズ後UIImage
    CGSize sz = CGSizeMake(img_mae.size.width*widthPer,
                           img_mae.size.height*heightPer);
    UIGraphicsBeginImageContext(sz);
    [img_mae drawInRect:CGRectMake(0, 0, sz.width, sz.height)];
    img_ato = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc]initWithImage:img_ato];
    imageView.center = CGPointMake(150, 100);
    [self.view addSubview:imageView];
    
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

- (IBAction)back:(id)sender {
   [ self dismissViewControllerAnimated:YES completion:nil];

}


-(void) setCity:(NSString*)city
{
    self.selectCity = city;
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
