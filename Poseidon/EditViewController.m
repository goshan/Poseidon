//
//  EditViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "EditViewController.h"
#import "Util.h"





@implementation EditViewController

@synthesize navBar = _navBar;
@synthesize navItem = _navItem;
@synthesize send = _send;
@synthesize cancel = _cancel;
@synthesize bg = _bg;
@synthesize titleInput = _titleInput;
@synthesize contentInput = _contentInput;






- (void) sendPublish{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) cancelPublish{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithTtitle:(NSString *)title andContent:(NSString *)content
{
    self = [super init];
    if (self) {
        // Custom initialization
        _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        _navItem = [[UINavigationItem alloc] init];
        
        UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)] autorelease];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButtonClick"] forState:UIControlStateHighlighted];
        [rightButton addTarget:self action:@selector(sendPublish) forControlEvents:UIControlEventTouchUpInside];
        _send = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        
        UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)] autorelease];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButton"] forState:UIControlStateNormal];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButtonClick"] forState:UIControlStateHighlighted];
        [leftButton addTarget:self action:@selector(cancelPublish) forControlEvents:UIControlEventTouchUpInside];
        _cancel = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        _bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, 320, 614)];
        
        _titleInput = [[gTextField alloc] initWithFrame:CGRectMake(10, 53, 300, 32) andMarginLeft:10];
        [_titleInput setTextContent:title];
        
        _contentInput = [[gTextArea alloc] initWithFrame:CGRectMake(10, 53+32, 300, 147) andMarginLeft:0];
        [_contentInput setTextContent:content];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_navItem setRightBarButtonItem:_send];
    [_navItem setLeftBarButtonItem:_cancel];
    
    [_navBar setBackgroundImage:[UIImage imageNamed:@"editNavi"] forBarMetrics:UIBarMetricsDefault];
    [_navBar setItems:[NSArray arrayWithObject:_navItem]];
    [self.view addSubview:_navBar];
    
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_titleInput setFont:[UIFont systemFontOfSize:13]];
    [_titleInput setTextColor:colorWithRGB(37, 24, 38)];
    [_titleInput setbackgroundImage:[UIImage imageNamed:@"editTitle"]];
    [self.view addSubview:_titleInput];
    
    [_contentInput setFont:[UIFont systemFontOfSize:14]];
    [_contentInput setTextColor:colorWithRGBA(37, 24, 38, 70)];
    [_contentInput setbackgroundImage:[UIImage imageNamed:@"editContent"]];
    [self.view addSubview:_contentInput];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"editNavi"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButton"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"cancelButtonClick"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
    
    UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"sendButtonClick"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightButton] autorelease];
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
    [self setTitleInput:nil];
    [self setContentInput:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_navBar release];
    [_navItem release];
    [_send release];
    [_cancel release];
    [_bg release];
    [_titleInput release];
    [_contentInput release];
    [super dealloc];
}

@end
