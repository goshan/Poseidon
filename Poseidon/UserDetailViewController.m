//
//  UserDetailViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "UserDetailViewController.h"
#import "Util.h"
#import "UserCreateSourceViewController.h"




@implementation UserDetailViewController

@synthesize bg = _bg;
@synthesize scroll = _scroll;
@synthesize titleBg = _titleBg;
@synthesize author = _author;
@synthesize time = _time;
@synthesize contentBg = _contentBg;
@synthesize content = _content;
@synthesize bottomImage = _bottomImage;
@synthesize source = _source;
@synthesize user = _user;





- (void) createSource{
    UserCreateSourceViewController *create = [[UserCreateSourceViewController alloc] init];
    [self presentViewController:create animated:YES completion:nil];
    [create release];
}

- (void) back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithSource:(NSDictionary *)source andUser:(NSDictionary *)user
{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:navFullScreenRect];
        _scroll = [[UIScrollView alloc] initWithFrame:navFullScreenRect];
        _titleBg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 300, 32)];
        _author = [[UILabel alloc] initWithFrame:CGRectMake(10+35, 9, 108, 32)];
        _time = [[UILabel alloc] initWithFrame:CGRectMake(10+35+108+35, 9, 120, 32)];
        _contentBg = [[UILabel alloc] initWithFrame:CGRectMake(10, 9+32, 300, connectionDetailsContentHeightMin)];
        _content = [[UILabel alloc] initWithFrame:CGRectMake(10+10, 9+32+10, 300-20, connectionDetailsContentHeightMin-20)];
        _bottomImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9+32+connectionDetailsContentHeightMin, 300, 3)];
        self.source = source;
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_titleBg setImage:[UIImage imageNamed:@"libDetailTitle"]];
    [_scroll addSubview:_titleBg];
    
    [_author setFont:[UIFont systemFontOfSize:13]];
    [_author setTextColor:[UIColor whiteColor]];
    [_author setBackgroundColor:[UIColor clearColor]];
    _author.text = [_user objectForKey:libAuthorKey];
    [_scroll addSubview:_author];
    
    [_time setFont:[UIFont systemFontOfSize:13]];
    [_time setTextColor:[UIColor whiteColor]];
    [_time setBackgroundColor:[UIColor clearColor]];
    _time.text = [Utils genTimeStr:[_source objectForKey:libTimeKey]];
    [_scroll addSubview:_time];
    
    [_content setFont:[UIFont systemFontOfSize:14]];
    [_content setTextColor:[UIColor whiteColor]];
    _content.alpha = 0.7;
    [_content setBackgroundColor:[UIColor clearColor]];
    _content.text = [_source objectForKey:libContentKey];
    _content.lineBreakMode = NSLineBreakByCharWrapping;
    _content.numberOfLines = 0;
    [_content sizeToFit];
    
    CGRect contentFrame = _content.frame;
    if (contentFrame.size.height > connectionDetailsContentHeightMin-20){
        CGRect contentBgFrame = _contentBg.frame;
        contentBgFrame.size.height = contentFrame.size.height+20;
        [_contentBg setFrame:contentBgFrame];
    }
    [_contentBg setBackgroundColor:colorWithRGBA(46, 23, 48, 30)];
    [_scroll addSubview:_contentBg];
    
    [_scroll addSubview:_content];
    
    CGRect contentBgFrame = _contentBg.frame;
    CGRect bottomFrame = _bottomImage.frame;
    bottomFrame.origin.y = contentBgFrame.origin.y + contentBgFrame.size.height;
    [_bottomImage setFrame:bottomFrame];
    [_bottomImage setImage:[UIImage imageNamed:@"libDetailBottom"]];
    [_scroll addSubview:_bottomImage];
    
    _scroll.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    _scroll.clipsToBounds = YES;
    _scroll.scrollEnabled = YES;
    [_scroll setContentSize:CGSizeMake(320, 9+32+contentBgFrame.size.height+3)];
    [_scroll setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_scroll];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"detailNavi"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButtonClick"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
    
    UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"createButton"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"createButtonClick"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(createSource) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightButton] autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setBg:nil];
    [self setScroll:nil];
    [self setTitleBg:nil];
    [self setAuthor:nil];
    [self setTime:nil];
    [self setContentBg:nil];
    [self setContent:nil];
    [self setBottomImage:nil];
    [self setSource:nil];
    [self setUser:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_bg release];
    [_scroll release];
    [_titleBg release];
    [_author release];
    [_time release];
    [_contentBg release];
    [_content release];
    [_bottomImage release];
    [_source release];
    [_user release];
    [super dealloc];
}

@end
