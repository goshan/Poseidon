//
//  Main2ViewController.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController


@property (retain, nonatomic) IBOutlet UIButton *button;
@property(retain, nonatomic) NSTimer *blinkTimer;


- (IBAction)arrowClick:(id)sender;

@end