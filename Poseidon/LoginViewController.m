//
//  LoginViewController.m
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "LoginViewController.h"
#import "Util.h"


@implementation LoginViewController



@synthesize bg = _bg;
@synthesize loginTitle = _loginTitle;
@synthesize usernameImg = _usernameImg;
@synthesize pwImg = _pwImg;
@synthesize usernameInputBg = _usernameInputBg;
@synthesize pwInputBg = _pwInputBg;
@synthesize usernameInput = _usernameInput;
@synthesize pwInput = _pwInput;
@synthesize loginButton = _loginButton;
@synthesize logoSmall = _logoSmall;
@synthesize logoLarge = _logoLarge;
@synthesize productInfo = _productInfo;
@synthesize test = _test;


//- (id)init
//{
//    self = [super init];
//    if (self) {
//        // Custom initialization
//        //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg2"] forBarMetrics:UIBarMetricsDefault];
//        //self.title = @"Login";
//        //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
//        //[self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageNamed:@"navigation_item_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    }
//    return self;
//}






- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    
    UIFont *font = [UIFont fontWithName:@"goshan" size:50];
    
    _bg = [[UIImageView alloc] initWithFrame:allFullScreenRect];
    [_bg setImage:[UIImage imageNamed:@"fullScreenBg"]];
    [self.view addSubview:_bg];
    
    _loginTitle = [[UIImageView alloc] initWithFrame:CGRectMake(115, 38, 90, 40)];
    [_loginTitle setImage:[UIImage imageNamed:@"loginText"]];
    [self.view addSubview:_loginTitle];
    
    _usernameImg = [[UIImageView alloc] initWithFrame:CGRectMake(22, 90, 36, 46)];
    [_usernameImg setImage:[UIImage imageNamed:@"loginUsername"]];
    [self.view addSubview:_usernameImg];
    
    _pwImg = [[UIImageView alloc] initWithFrame:CGRectMake(22, 90+46, 36, 46)];
    [_pwImg setImage:[UIImage imageNamed:@"loginPW"]];
    [self.view addSubview:_pwImg];
    
    _usernameInputBg = [[UIImageView alloc] initWithFrame:CGRectMake(22+36, 90, 240, 46)];
    [_usernameInputBg setImage:[UIImage imageNamed:@"loginInput"]];
    [self.view addSubview:_usernameInputBg];
    
    _usernameInput = [[UITextField alloc] initWithFrame:CGRectMake(22+36+10, 90, 240-10, 46)];
    [_usernameInput setBorderStyle:UITextBorderStyleNone];
    [_usernameInput setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_usernameInput setBackgroundColor:[UIColor clearColor]];
    [_usernameInput setPlaceholder:@"Username"];
    [_usernameInput setFont:font];
    [_usernameInput setAlpha:0.5];
    [_usernameInput setTextColor:[UIColor whiteColor]];
    _usernameInput.delegate = self;
    [self.view addSubview:_usernameInput];
    
    _pwInputBg = [[UIImageView alloc] initWithFrame:CGRectMake(22+36, 90+46, 240, 46)];
    [_pwInputBg setImage:[UIImage imageNamed:@"loginInput"]];
    [self.view addSubview:_pwInputBg];
    
    _pwInput = [[UITextField alloc] initWithFrame:CGRectMake(22+36+10, 90+46, 240-10, 46)];
    [_pwInput setBorderStyle:UITextBorderStyleNone];
    [_pwInput setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_pwInput setBackgroundColor:[UIColor clearColor]];
    [_pwInput setPlaceholder:@"Password"];
    [_pwInput setFont:font];
    [_pwInput setAlpha:0.5];
    [_pwInput setTextColor:[UIColor whiteColor]];
    _pwInput.delegate = self;
    [self.view addSubview:_pwInput];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(22, 90+2*46, 276, 46)];
    [_loginButton setTitle:@"" forState:UIControlStateNormal];
    [_loginButton setTitle:@"" forState:UIControlStateHighlighted];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"loginButton"] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"loginButtonClick"] forState:UIControlStateHighlighted];
    [self.view addSubview:_loginButton];
    
    _logoSmall = [[UIImageView alloc] initWithFrame:CGRectMake(100, 229, 120, 30)];
    [_logoSmall setAlpha:0];
    [_logoSmall setImage:[UIImage imageNamed:@"loginLogoSmall"]];
    [self.view addSubview:_logoSmall];
    
    _logoLarge = [[UIImageView alloc] initWithFrame:CGRectMake(72, 323, 176, 30)];
    [_logoLarge setImage:[UIImage imageNamed:@"loginLogoLarge"]];
    [self.view addSubview:_logoLarge];
    
    _productInfo = [[UIImageView alloc] initWithFrame:CGRectMake(72, 445, 176, 15)];
    [_productInfo setImage:[UIImage imageNamed:@"loginEBText"]];
    [self.view addSubview:_productInfo];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setBg:nil];
    [self setLoginTitle:nil];
    [self setUsernameImg:nil];
    [self setPwImg:nil];
    [self setUsernameInputBg:nil];
    [self setUsernameInput:nil];
    [self setPwInputBg:nil];
    [self setPwInput:nil];
    [self setLoginButton:nil];
    [self setLogoSmall:nil];
    [self setLogoLarge:nil];
    [self setProductInfo:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_bg release];
    [_loginTitle release];
    [_usernameImg release];
    [_pwImg release];
    [_usernameInput release];
    [_usernameInputBg release];
    [_pwInputBg release];
    [_pwInput release];
    [_loginButton release];
    [_logoLarge release];
    [_productInfo release];
    [_logoSmall release];
    [super dealloc];
}



// TextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _logoSmall.alpha = 1;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _logoSmall.alpha = 0;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}




@end
