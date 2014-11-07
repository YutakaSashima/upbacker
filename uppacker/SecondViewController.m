//
//  SecondViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "SecondViewController.h"

#import "MapManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
  //
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
    CGFloat width = 120;  // リサイズ後幅のサイズ
    CGFloat height = 120;  // リサイズ後高さのサイズ
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0, 0, width, height)];
    scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:scaledImage];
    
    int row = i / 3;
    int col = i % 3;
    iv.center = CGPointMake(col * width + width/2, row * height + height/2);
    [self.view addSubview:iv];
  }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
