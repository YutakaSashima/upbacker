//
//  RunViewController.h
//  uppacker
//
//  Created by Matsumura Katsuhiro on 2014/11/07.
//  Copyright (c) 2014年 Matsumura Katsuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *targetPoint;

@property (strong, nonatomic) IBOutlet UIImageView *playerImg;

- (IBAction)dash:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *goaldist;

@property (strong,nonatomic) UIImageView *playerImgView;
- (IBAction)backmenu:(id)sender;

- (IBAction)tomapbtn:(id)sender;

- (IBAction)tobg:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *topbtnout;
@property (strong, nonatomic) IBOutlet UIButton *nextbtnout;

@property (strong, nonatomic) IBOutlet UIButton *mapbtnout;
@property (strong, nonatomic) IBOutlet UIButton *badgebtnout;

- (IBAction)next:(id)sender;

//@property (strong, nonatomic) IBOutlet UIImageView *nextout;

@end
