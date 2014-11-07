//
//  DetailViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

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
    // Do any additional setup after loading the view.
    

    if([self.selectCity isEqualToString:@"パリ"]){
        NSLog(@"1");
        
    }
    else if([self.selectCity  isEqualToString:@"バルセロナ"]){
        NSLog(@"2");
        
    }
    else if([self.selectCity  isEqualToString:@"ミラノ"]){
        NSLog(@"3");
        
    }
    else if([self.selectCity  isEqualToString:@"ミュンヘン"]){
        NSLog(@"4");
        
    }
    else if([self.selectCity  isEqualToString:@"アムステルダム"]){
        NSLog(@"5");
        
    }
    else if([self.selectCity  isEqualToString:@"ローマ"]){
        NSLog(@"6");
        
    }
    else{
        NSLog(@"バグ");
    }
        
        
    //画像
    UIImage *img_mae = [UIImage imageNamed:@"roma_photo.jpg"];  // リサイズ前UIImage
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


@end
