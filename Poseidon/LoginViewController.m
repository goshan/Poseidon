//
//  LoginViewController.m
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "LoginViewController.h"
#import "Util.h"
#import "AdminViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "MainViewController.h"


@implementation LoginViewController



@synthesize bg = _bg;
@synthesize loginTitle = _loginTitle;
@synthesize usernameImg = _usernameImg;
@synthesize pwImg = _pwImg;
@synthesize usernameInput = _usernameInput;
@synthesize pwInput = _pwInput;
@synthesize loginButton = _loginButton;
@synthesize logoSmall = _logoSmall;
@synthesize logoLarge = _logoLarge;
@synthesize productInfo = _productInfo;
@synthesize parent = _parent;
@synthesize tips = _tips;
@synthesize url = _url;



- (id)initWithParent:(MainViewController *)parent{
    self = [super init];
    if (self) {
        // Custom initialization
        _url = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, 320, 48)];
        
        _bg = [[UIImageView alloc] initWithFrame:allFullScreenRect];
        _loginTitle = [[UIImageView alloc] initWithFrame:CGRectMake(115, 38, 90, 40)];
        _usernameImg = [[UIImageView alloc] initWithFrame:CGRectMake(22, 90, 36, 46)];
        _pwImg = [[UIImageView alloc] initWithFrame:CGRectMake(22, 90+46, 36, 46)];
        _usernameInput = [[gTextField alloc] initWithFrame:CGRectMake(22+36, 90, 240, 46) andMarginLeft:10];
        _pwInput = [[gTextField alloc] initWithFrame:CGRectMake(22+36, 90+46, 240, 46) andMarginLeft:10];
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(22, 90+2*46, 276, 46)];
        _logoSmall = [[UIImageView alloc] initWithFrame:CGRectMake(100, 229, 120, 30)];
        _logoLarge = [[UIImageView alloc] initWithFrame:CGRectMake(72, 323, 176, 30)];
        _productInfo = [[UIImageView alloc] initWithFrame:CGRectMake(72, 445, 176, 15)];
        self.parent = parent;
        _tips = [[tipsAlert alloc] initWith:self.view];
    }
    return self;
}




- (void)login{
    [_usernameInput releaseInput];
    [_pwInput releaseInput];
    
    if (_url.text){
        [Utils saveServerURL:_url.text];
    }
    
    [_tips showLoadingWithContent:@"登录中..."];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //make url request
    NSURL *url = [NSURL URLWithString:[Utils getServerURL]];
    AFHTTPClient *httpClient = [[[AFHTTPClient alloc] initWithBaseURL:url]autorelease];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSString *request_type = @"mobile";
    NSString *username = [_usernameInput getTextContent];
    NSString *password = [_pwInput getTextContent];
    
    [params setObject:request_type forKey:@"request_type"];
    [params setObject:(username ? username : @"") forKey:@"user.username"];
    [params setObject:(password ? password : @"") forKey:@"user.password"];
    
    NSString *path = @"EBP1/userAction_login.action";
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:path parameters:params];
    
    //put request
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [_tips hiddenLoading];
        [_pwInput setTextContent:@""];
        
        NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
        NSString *result = [feedback objectForKey:@"flag"];
        
        if ([result isEqualToString:@"login_success"]){
            [defaults setObject:[feedback objectForKey:@"access_token"] forKey:userToken];
            NSString *user_type = [feedback objectForKey:@"user_type"];
            [_parent loginViewSwitch:user_type];
        }
        else {
            NSString *err_msg;
            if ([result isEqualToString:@"not_exist"]){
                err_msg = @"用户不存在";
            }
            else if ([result isEqualToString:@"password_wrong"]){
                err_msg = @"密码错误";
            }
            else if ([result isEqualToString:@"unknown_request_type"]){
                err_msg = @"登陆类型错误";
            }
            else if ([result isEqualToString:@"false_to_create_access_token"]){
                err_msg = @"无法创建token";
            }
            else {
                err_msg = result;
            }
            [_tips showTipsWithTitle:@"登陆错误" andMessage:err_msg andDuration:TipsShowTime];
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [_tips hiddenLoading];
        [_tips showErrorAlertWithTitle:@"网络错误" andMessage:@"少年乃确定网络连接好了" andButtonTitle:@"囧"];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
    [operation start];
    
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    UIFont *font = [UIFont systemFontOfSize:15];
    
    [_bg setImage:[UIImage imageNamed:@"fullScreenBg"]];
    [self.view addSubview:_bg];
    
    [_loginTitle setImage:[UIImage imageNamed:@"loginText"]];
    [self.view addSubview:_loginTitle];
    
    [_usernameImg setImage:[UIImage imageNamed:@"loginUsername"]];
    [self.view addSubview:_usernameImg];
    
    [_pwImg setImage:[UIImage imageNamed:@"loginPW"]];
    [self.view addSubview:_pwImg];
    
    [_usernameInput setPlaceholder:@"Username"];
    [_usernameInput setFont:font];
    [_usernameInput setAlpha:0.5];
    [_usernameInput setTextColor:[UIColor whiteColor]];
    [_usernameInput setbackgroundImage:[UIImage imageNamed:@"loginInput"]];
    [_usernameInput setClearButtonShow];
    [_usernameInput setDelegate:self];
    [self.view addSubview:_usernameInput];
    
    [_pwInput setPlaceholder:@"Password"];
    [_pwInput setFont:font];
    [_pwInput setAlpha:0.5];
    [_pwInput setTextColor:[UIColor whiteColor]];
    [_pwInput setbackgroundImage:[UIImage imageNamed:@"loginInput"]];
    [_pwInput setClearButtonShow];
    [_pwInput setDelegate:self];
    [_pwInput setPassword];
    [self.view addSubview:_pwInput];
    
    [_loginButton setTitle:@"" forState:UIControlStateNormal];
    [_loginButton setTitle:@"" forState:UIControlStateHighlighted];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"loginButton"] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"loginButtonClick"] forState:UIControlStateHighlighted];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    [_logoSmall setAlpha:0];
    [_logoSmall setImage:[UIImage imageNamed:@"loginLogoSmall"]];
    [self.view addSubview:_logoSmall];
    
    [_logoLarge setImage:[UIImage imageNamed:@"loginLogoLarge"]];
    [self.view addSubview:_logoLarge];
    
    [_productInfo setImage:[UIImage imageNamed:@"loginEBText"]];
    [self.view addSubview:_productInfo];
    
    [_url setBorderStyle:UITextBorderStyleNone];
    [_url setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_url setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_url];
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
    [self setUsernameInput:nil];
    [self setPwInput:nil];
    [self setLoginButton:nil];
    [self setLogoSmall:nil];
    [self setLogoLarge:nil];
    [self setProductInfo:nil];
    [self setParent:nil];
    [self setTips:nil];
    [self setUrl:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_bg release];
    [_loginTitle release];
    [_usernameImg release];
    [_pwImg release];
    [_usernameInput release];
    [_pwInput release];
    [_loginButton release];
    [_logoLarge release];
    [_productInfo release];
    [_logoSmall release];
    [_parent release];
    [_tips release];
    [_url release];
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
