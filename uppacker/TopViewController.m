//
//  TopViewController.m
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import "TopViewController.h"
#import "RunViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    NSLog(@"OpenRun");
    
    RunViewController *run = [self.storyboard instantiateViewControllerWithIdentifier:@"RunView"];
    
    //選択ピンのタイトル取得してビューコントローラに設置
    /*MyAnnotation *test;
    test = annotationView.annotation;
    [detailViewController setCity:test.title];
    */
    
    
    //ビューコントローラの表示
    [self presentModalViewController:run animated:YES];
}
@end
