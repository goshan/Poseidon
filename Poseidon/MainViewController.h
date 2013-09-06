//
//  Main2ViewController.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface MainViewController : UIViewController

@property (retain, nonatomic) UIImageView *cover;

@property (retain, nonatomic) UIButton *button;

@property(retain, nonatomic) NSTimer *blinkTimer;

@property (retain, nonatomic) LoginViewController *login;

@property (retain, nonatomic) UINavigationController *nav;




- (void)loginViewSwitch:(NSString *)user_type;

- (void)logoutViewSwitch;

@end
