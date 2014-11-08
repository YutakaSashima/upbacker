//
//  SecondViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

- (IBAction)backbtn:(id)sender;
- (IBAction)goTop:(id)sender;
- (IBAction)gomap:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *badgebg;

@property (strong, nonatomic) IBOutlet UIButton *topbtnout;

@property (strong, nonatomic) IBOutlet UIButton *mapbtnout;

@property (strong, nonatomic) IBOutlet UIButton *bgbtnout;
- (IBAction)change:(id)sender;

@end

