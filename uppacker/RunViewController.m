//
//  RunViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "RunViewController.h"

@interface RunViewController ()

@end

@implementation RunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.targetPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pari.jpg"]];
    //self.targetPoint.center = CGPointMake(150, 150);
    //self.targetPoint.tag = ButtonActionsBehaviorTypeAnimateTrash;
    //[self.view addSubview:self.targetPoint];
    //self.targetPoint.image = [UIImage imageNamed:@"pari.jpg"];
    //self.playerImg.image =[UIImage imageNamed:@"dash.png"];

    
    UIImage *img_mae = [UIImage imageNamed:@"pari.jpg"];  // リサイズ前UIImage
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
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:img_ato2];
    imageView2.center = CGPointMake(180, 100);
    [self.view addSubview:imageView2];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    /*
    UIImage *img_mae = [UIImage imageNamed:@"pari.jpg"];  // リサイズ前UIImage
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
    imageView.center = CGPointMake(50, 100);
    [self.view addSubview:imageView];*/
    
    /*
    // 画像を表示する
    UIImage *image = [UIImage imageNamed:@"dash.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.center = CGPointMake(160, 240);
    
    [self.view addSubview:imageView];
    */
    
    
    
    // アニメーション
    /*[UIView animateWithDuration:2.5f // アニメーション速度2.5秒
                          delay:1.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         // 画像を2倍に拡大
                         imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
                         
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         NSLog(@"アニメーション終了");
                     }];*/
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

@end
