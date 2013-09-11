//
//  UserCreateSourceViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "UserCreateSourceViewController.h"
#import "Util.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import <QuartzCore/QuartzCore.h>




@implementation UserCreateSourceViewController

@synthesize navBar = _navBar;
@synthesize navItem = _navItem;
@synthesize send = _send;
@synthesize cancel = _cancel;
@synthesize bg = _bg;
@synthesize input = _input;
@synthesize tips = _tips;






- (void) sendSource{
    [_input resignFirstResponder];
    
    [_tips showLoadingWithContent:@"发布中..."];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //make url request
    NSURL *url = [NSURL URLWithString:[Utils getServerURL]];
    AFHTTPClient *httpClient = [[[AFHTTPClient alloc] initWithBaseURL:url]autorelease];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSString *request_type = @"mobile";
    NSString *access_token = [defaults objectForKey:userToken];
    NSString *content = _input.text;
    
    [params setObject:request_type forKey:@"request_type"];
    [params setObject:(access_token ? access_token : @"") forKey:@"access_token"];
    [params setObject:(content ? content : @"") forKey:@"content"];
    
    NSString *path = @"EBP1/communicationAjaxAction_addSource.action";
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:path parameters:params];
    
    //put request
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [_tips hiddenLoading];
        
        NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
        NSString *result = [feedback objectForKey:@"flag"];
        
        if ([result isEqualToString:@"success_addSourceByMobile"]){
            [_tips showTipsWithTitle:@"添加成功" andMessage:@"素材池" andDuration:TipsShowTime];
            [self performSelector:@selector(cancelSource) withObject:nil afterDelay:TipsShowTime];
        }
        else {
            NSString *err_msg;
            if ([result isEqualToString:@"unknown_request_type"]){
                err_msg = @"请求类型错误";
            }
            else if ([result isEqualToString:@"fail_to_get_user_by_accesstoken"]){
                err_msg = @"无法创建token";
            }
            else {
                err_msg = result;
            }
            [_tips showTipsWithTitle:@"添加错误" andMessage:err_msg andDuration:TipsShowTime];
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [_tips hiddenLoading];
        
        [_tips showErrorAlertWithTitle:@"网络错误" andMessage:@"少年乃确定网络连接好了" andButtonTitle:@"囧"];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
    [operation start];
}

- (void) cancelSource{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        _navItem = [[UINavigationItem alloc] init];
        
        UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)] autorelease];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButtonClick"] forState:UIControlStateHighlighted];
        [rightButton addTarget:self action:@selector(sendSource) forControlEvents:UIControlEventTouchUpInside];
        _send = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        
        UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)] autorelease];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButton"] forState:UIControlStateNormal];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButtonClick"] forState:UIControlStateHighlighted];
        [leftButton addTarget:self action:@selector(cancelSource) forControlEvents:UIControlEventTouchUpInside];
        _cancel = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        _bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, 320, 614)];
                
        _input = [[UITextView alloc] initWithFrame:CGRectMake(10, 53, 300, 180)];
        
        _tips = [[tipsAlert alloc] initWith:self.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_navItem setRightBarButtonItem:_send];
    [_navItem setLeftBarButtonItem:_cancel];
    
    [_navBar setBackgroundImage:[UIImage imageNamed:@"createNavi"] forBarMetrics:UIBarMetricsDefault];
    [_navBar setItems:[NSArray arrayWithObject:_navItem]];
    [self.view addSubview:_navBar];
    
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_input setFont:[UIFont systemFontOfSize:14]];
    [_input setTextColor:colorWithRGBA(255, 255, 255, 70)];
    [_input setBackgroundColor:colorWithRGBA(46, 23, 48, 30)];
    CALayer *layer = _input.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 5.0;
    [self.view addSubview:_input];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setNavBar:nil];
    [self setNavItem:nil];
    [self setSend:nil];
    [self setCancel:nil];
    [self setBg:nil];
    [self setTips:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_navBar release];
    [_navItem release];
    [_send release];
    [_cancel release];
    [_bg release];
    [_tips release];
    [super dealloc];
}

@end
