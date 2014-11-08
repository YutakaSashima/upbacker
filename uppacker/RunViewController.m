//
//  RunViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "RunViewController.h"
#import "MapManager.h"
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface RunViewController ()

@end

@implementation RunViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.targetPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pari.jpg"]];
    //self.targetPoint.center = CGPointMake(150, 150);
    //self.targetPoint.tag = ButtonActionsBehaviorTypeAnimateTrash;
    //[self.view addSubview:self.targetPoint];
    //self.targetPoint.image = [UIImage imageNamed:@"pari.jpg"];
    //self.playerImg.image =[UIImage imageNamed:@"dash.png"];

    
    
    /*UIImage *img_mae = [UIImage imageNamed:@"pari.jpg"];  // リサイズ前UIImage
    UIImage *img_ato;  // リサイズ後UIImage
    float widthPer = 0.2;  // リサイズ後幅の倍率
    float heightPer = 0.2;  // リサイズ後高さの倍率
    CGSize sz = CGSizeMake(img_mae.size.width*widthPer,
                           img_mae.size.height*heightPer);
    UIGraphicsBeginImageContext(sz);
    [img_mae drawInRect:CGRectMake(0, 0, sz.width, sz.height)];
    img_ato = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc]initWithImage:img_ato];
    imageView.center = CGPointMake(40, 100);
    [self.view addSubview:imageView];
    */
    
    UIImage *img_mae = [UIImage imageNamed:@"top_0.png"];  // リサイズ前UIImage
    UIImage *img_ato;  // リサイズ後UIImage
    float widthPer = 0.5;  // リサイズ後幅の倍率
    float heightPer = 0.5;  // リサイズ後高さの倍率
    CGSize sz = CGSizeMake(img_mae.size.width*widthPer,
                           img_mae.size.height*heightPer);
    UIGraphicsBeginImageContext(sz);
    [img_mae drawInRect:CGRectMake(0, 0, sz.width, sz.height)];
    img_ato = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc]initWithImage:img_ato];
    imageView.center = CGPointMake(160, 283);
    
    self.targetPoint.image = img_mae;
    
    //imageView.frame =  CGRectMake(0, 0, 640, 1136);
    
    
    //[self.view addSubview:imageView];
    
    
    /*
    UIImage *img_mae2 = [UIImage imageNamed:@"dash.png"];  // リサイズ前UIImage
    UIImage *img_ato2;  // リサイズ後UIImage
    float widthPer2 = 0.2;  // リサイズ後幅の倍率
    float heightPer2 = 0.2;  // リサイズ後高さの倍率
    CGSize sz2 = CGSizeMake(img_mae2.size.width*widthPer2,
                           img_mae2.size.height*heightPer2);
    UIGraphicsBeginImageContext(sz2);
    [img_mae2 drawInRect:CGRectMake(0, 0, sz2.width, sz2.height)];
    img_ato2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.playerImgView = [[UIImageView alloc]initWithImage:img_ato2];
    self.playerImgView.frame =  CGRectMake(180, 100, 80, 80);
    [self.view addSubview:self.playerImgView];
     
     
    */
    
    /*UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50) ];
    button.titleLabel.text = [NSString stringWithFormat: @"Button"];
    [self.view addSubview:button];*/
    
    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame; // CGRect: UIViewのインスタンスメソッド
    button.tag   = tag;   // NSInteger: UIViewのインスタンスメソッド
    [button setTitle:title forState:UIControlStateNormal]; // UIButtonのインスタンスメソッド
     */
    
    /*UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 0, 100, 100);
    btn.titleLabel.text = @"abc";
    //[btn setImage:img forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];*/
    
}

//


-(void)viewDidAppear:(BOOL)animated{
    //場所を初期位置にする
    self.playerImgView.frame = CGRectMake(180, 100, 80, 80);
    self.goaldist.text = @"残り100歩";
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

//ダッシュボタン
- (IBAction)dash:(id)sender {
    [[MapManager sharedManager] addMoveDistance:100000];
    NSLog(@"walkcnt:%d :%lf",[MapManager sharedManager].walkCount,[MapManager sharedManager].ratio);
    self.goaldist.text = @"残り100歩";

    //場所を初期位置にする
    self.playerImgView.frame= CGRectMake(180, 100, 80, 80);
    
    [UIView animateWithDuration:2.0f // アニメーション速度2.5秒
     delay:0.1f // 1秒後にアニメーション
     options:UIViewAnimationOptionCurveEaseIn
     animations:^{
         //移動して小さくする
         self.playerImgView.frame= CGRectMake(80, 100, 80, 80);
     
     } completion:^(BOOL finished) {
         // アニメーション終了時
         NSLog(@"アニメーション終了");
     }];
}
- (IBAction)backmenu:(id)sender {
    [ self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tomapbtn:(id)sender {
    //FirstViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"map"];
    //ビューコントローラの表示
    //[self presentModalViewController:run animated:YES];
    
    
    FirstViewController *secondVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"map"];
    
    //secondVC.secondNum = self.firstNum;
    [self presentViewController:secondVC animated:YES completion:nil];
    
}

- (IBAction)tobg:(id)sender {
    
    SecondViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    //ビューコントローラの表示
    [self presentModalViewController:run animated:YES];

}
@end
