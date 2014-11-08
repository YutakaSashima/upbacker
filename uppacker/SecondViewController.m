//
//  SecondViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "RunViewController.h"

#import "MapManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
  //
  /*CGRect screenRect = [[UIScreen mainScreen] bounds];
  CGFloat screenWidth = screenRect.size.width;
  CGFloat screenHeight = screenRect.size.height;
  CGFloat margin = 10.0;
  
  MapManager* manager = [MapManager sharedManager];
  NSArray* points = [manager points];
  NSArray* visitPoints = [manager visitPoints];
  
  for (int i=0; i<[points count]; i++) {
    UIImage *image = nil;
    if ([visitPoints containsObject:[points objectAtIndex:i]]) {
      image = [UIImage imageNamed:@"badge_unlocked.png"];
    } else {
      image = [UIImage imageNamed:@"badge_locked.png"];
    }
    UIImage *scaledImage;  // リサイズ後UIImage
    CGFloat width = (screenWidth - 4 * margin) / 3.0;  // リサイズ後幅のサイズ
    CGFloat height = width;  // リサイズ後高さのサイズ
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0, 0, width, height)];
    scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:scaledImage];
    
    int row = i / 3;
    int col = i % 3;
    iv.center = CGPointMake(col * (width + margin) + width/2 + margin,
                            row * (height + margin) + height/2 + margin);
    [self.view addSubview:iv];
  }
   */
    
    
    UIImage *img_mae = [UIImage imageNamed:@"badge_bg.png"];  // リサイズ前UIImage
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
    
    self.badgebg.image = img_mae;
    
    /*
    
    UIImage *imgs = [UIImage imageNamed:@"home_b"];
    [self.topbtnout setBackgroundImage:imgs forState:UIControlStateNormal];
    
    UIImage *imgs2 = [UIImage imageNamed:@"map_b"];
    [self.mapbtnout setBackgroundImage:imgs2 forState:UIControlStateNormal];
    
    UIImage *imgs3 = [UIImage imageNamed:@"badge_b"];
    [self.badgebtnout setBackgroundImage:imgs3 forState:UIControlStateNormal];
     */
    
    UIImage *imgs = [UIImage imageNamed:@"home_b"];
    [self.topbtnout setBackgroundImage:imgs forState:UIControlStateNormal];
    
    UIImage *imgs2 = [UIImage imageNamed:@"map_b"];
    [self.mapbtnout setBackgroundImage:imgs2 forState:UIControlStateNormal];
    
    UIImage *imgs3 = [UIImage imageNamed:@"badge_b"];
    [self.bgbtnout setBackgroundImage:imgs3 forState:UIControlStateNormal];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backbtn:(id)sender {
    [ self dismissViewControllerAnimated:YES completion:nil];    
}

- (IBAction)goTop:(id)sender {
    RunViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"RunView"];
    //ビューコントローラの表示
    [self presentModalViewController:run animated:YES];

}

- (IBAction)gomap:(id)sender {
    FirstViewController *secondVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"map"];
    
    //secondVC.secondNum = self.firstNum;
    [self presentViewController:secondVC animated:YES completion:nil];

}
@end
