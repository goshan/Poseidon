//
//  LoginViewController.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) UIImageView *loginTitle;

@property (retain, nonatomic) UIImageView *usernameImg;

@property (retain, nonatomic) UIImageView *pwImg;

@property (retain, nonatomic) UIImageView *usernameInputBg;

@property (retain, nonatomic) UIImageView *pwInputBg;

@property (retain, nonatomic) UITextField *usernameInput;

@property (retain, nonatomic) UITextField *pwInput;

@property (retain, nonatomic) UIButton *loginButton;

@property (retain, nonatomic) UIImageView *logoSmall;

@property (retain, nonatomic) UIImageView *logoLarge;

@property (retain, nonatomic) UIImageView *productInfo;

@property (retain, nonatomic) UITextField *test;




@end
