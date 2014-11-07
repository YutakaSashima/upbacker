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
    
    self.targetPoint.image = [UIImage imageNamed:@"pari.jpg"];
    self.playerImg.image =[UIImage imageNamed:@"dash.png"];
    
    
    
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
