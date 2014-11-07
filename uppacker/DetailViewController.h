//
//  DetailViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/08.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
- (IBAction)back:(id)sender;
-(void) setCity:(NSString*)city;
//選んだ街名
@property (strong, nonatomic) NSString *selectCity;

@end
