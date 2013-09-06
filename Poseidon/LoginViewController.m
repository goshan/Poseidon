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



- (id)initWithParent:(MainViewController *)parent{
    self = [super init];
    if (self) {
        // Custom initialization
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
    }
    return self;
}




- (void)login{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    //push user regist data to server
//    //make url request
//    NSURL *url = [NSURL URLWithString:SERVER_URL];
//    AFHTTPClient *httpClient = [[[AFHTTPClient alloc] initWithBaseURL:url]autorelease];
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    
//    NSString *request_type = @"mobile";
//    NSString *username = [_usernameInput getTextContent];
//    NSString *password = [_pwInput getTextContent];
//    
//    [params setObject:request_type forKey:@"request_type"];
//    [params setObject:username forKey:@"user.username"];
//    [params setObject:password forKey:@"user.password"];
//    
//    NSString *path = @"/EBP1/userAction_login.action";
//    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:path parameters:params];
//    
//    //put request
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        //get respond json from server
//        NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
//        NSString *result = [feedback objectForKey:@"flag"];
//        
//        if ([result isEqualToString:@"sucess"]){
//            NSArray *list = [feedback objectForKey:@"list"];
//            [_tips showRegistFinishedWith:self.view andList:list];
//        }
//        else {
//            NSLog(@"user error!!");
//        }
//        [defaults setObject:[feedback objectForKey:@"user_id"] forKey:USERID_KEY];
//        [defaults setObject:[feedback objectForKey:@"token"] forKey:TOKEN_KEY];
//        
//        //dismiss regist view
//        [self performSelector:@selector(hiddenRegistView) withObject:nil afterDelay:3.0];
//        [_tips hiddenRegistLoading];
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        [_tips hiddenRegistLoading];
//        [_tips netErrorAlert];
//        
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    }];
    NSString *user_type = @"admin";
    [_parent loginViewSwitch:user_type];
    
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
    [_usernameInput setDelegate:self];
    [self.view addSubview:_usernameInput];
    
    [_pwInput setPlaceholder:@"Password"];
    [_pwInput setFont:font];
    [_pwInput setAlpha:0.5];
    [_pwInput setTextColor:[UIColor whiteColor]];
    [_pwInput setbackgroundImage:[UIImage imageNamed:@"loginInput"]];
    [_pwInput setDelegate:self];
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
