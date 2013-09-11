//
//  Main2ViewController.m
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "MainViewController.h"
#import "Util.h"
#import "gAnimation.h"
#import "AdminViewController.h"
#import "UserViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"





@implementation MainViewController

BOOL isBlink = YES;


@synthesize cover = _cover;
@synthesize button = _button;
@synthesize blinkTimer = _blinkTimer;
@synthesize login = _login;
@synthesize nav = _nav;
@synthesize tips = _tips;





- (void) starBlink{
    [gAnimation makeView:_button blinkWithDuration:mainPageBlinkCycle];
}

- (void)makeViewBlink{
    if (isBlink){
        [self starBlink];
        self.blinkTimer = [NSTimer scheduledTimerWithTimeInterval:mainPageBlinkCycle target:self selector:@selector(starBlink) userInfo:nil repeats:YES];
        isBlink = YES;
    }
    else if (isBlink){
        [_blinkTimer invalidate];
        isBlink = NO;
    }
}

- (void) showStatusBar{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)hiddenCover {
    [gAnimation moveView:_cover toFinalFrame:CGRectMake(0, -480, 320, 480) withDuration:mainPageHiddenTime];
    [gAnimation moveView:_button toFinalFrame:CGRectMake(136, -48, 48, 48) withDuration:mainPageHiddenTime];
    [self performSelector:@selector(showStatusBar)withObject:nil afterDelay:mainPageHiddenTime];
}

- (void)loginViewSwitch:(NSString *)user_type{
    [_tips showLoadingWithContent:@"载入中..."];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //make url request
    NSURL *url = [NSURL URLWithString:[Utils getServerURL]];
    AFHTTPClient *httpClient = [[[AFHTTPClient alloc] initWithBaseURL:url]autorelease];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSString *request_type = @"mobile";
    NSString *access_token = [defaults objectForKey:userToken];
    
    [params setObject:request_type forKey:@"request_type"];
    [params setObject:(access_token ? access_token : @"") forKey:@"access_token"];
    
    NSString *path = [user_type isEqualToString:@"admin"] ? @"EBP1/communicationAjaxAction_getConnectionRecommend.action" : @"EBP1/communicationAjaxAction_getSourcesYesterdayAndToday.action";
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:path parameters:params];
    
    //put request
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [_tips hiddenLoading];
        
        NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
        NSString *result = [feedback objectForKey:@"flag"];
        
        if ([result isEqualToString:@"success_get_connection_recommend"] || [result isEqualToString:@"success_get_sources"]){
            UIViewController *info;
            if ([user_type isEqualToString:@"admin"]){
                info = [[AdminViewController alloc] initWithData:[feedback objectForKey:@"connection"] andMainController:self];
            }
            else {
                info = [[UserViewController alloc] initWithData:[feedback objectForKey:@"source"] andMainController:self];
            }
            
            _nav = [[UINavigationController alloc] initWithRootViewController:info];
            [info release];
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:loadingFinishedAnimate];
            
            [_login.view removeFromSuperview];
            [self.view addSubview:_nav.view];
            [UIView commitAnimations];
        }
        else {
            NSString *err_msg;
            if ([result isEqualToString:@"fail_to_get_user_by_accesstoken"]){
                err_msg = @"授权未成功";
            }
            else if ([result isEqualToString:@"unknown_request_type"]){
                err_msg = @"请求类型错误";
            }
            else {
                err_msg = result;
            }
            [_tips showTipsWithTitle:@"载入错误" andMessage:err_msg andDuration:TipsShowTime];
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [_tips hiddenLoading];
        [_tips showErrorAlertWithTitle:@"网络错误" andMessage:@"少年乃确定网络连接好了" andButtonTitle:@"囧"];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
    [operation start];
}

- (void)logoutViewSwitch{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:loadingFinishedAnimate];
    
    [_nav.view removeFromSuperview];
    [self.view addSubview:_login.view];
    [_nav release];
    
    [UIView commitAnimations];
}



- (id)init{
    self = [super init];
    if (self){
        _login = [[LoginViewController alloc] initWithParent:self];
        _cover = [[UIImageView alloc] initWithFrame:allFullScreenRect];
        _button = [[UIButton alloc] initWithFrame:CGRectMake(136, 480-48, 48, 48)];
        _tips = [[tipsAlert alloc] initWith:self.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_login.view];

    [_cover setImage:[UIImage imageNamed:@"banner"]];
    UISwipeGestureRecognizer *gesture = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenCover)] autorelease];
    [gesture setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addSubview:_cover];
    
    [_button setImage:[UIImage imageNamed:@"motion"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(hiddenCover) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    [self.view addGestureRecognizer:gesture];
    [self makeViewBlink];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setBlinkTimer:nil];
    [self setButton:nil];
    [self setCover:nil];
    [self setLogin:nil];
    [self setTips:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_button release];
    [_cover release];
    [_blinkTimer release];
    [_login release];
    [_tips release];
    [super dealloc];
}

@end
