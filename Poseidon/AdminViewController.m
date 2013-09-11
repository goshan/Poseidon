//
//  AdminViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "AdminViewController.h"
#import "Util.h"
#import "ConnectionViewController.h"
#import "LibraryViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"




BOOL isConnection = YES;

@implementation AdminViewController

@synthesize tableView = _tableView;
@synthesize bg = _bg;
@synthesize connection = _connection;
@synthesize library = _library;
@synthesize main = _main;
@synthesize content = _content;
@synthesize tips = _tips;





- (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:userToken];
    
    [_main logoutViewSwitch];
}

- (void)loadConnection{
    if (!isConnection){
        isConnection = YES;
        
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
        
        NSString *path = @"EBP1/communicationAjaxAction_getConnectionRecommend.action";
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:path parameters:params];
        
        //put request
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            [_tips hiddenLoading];
            
            NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
            NSString *result = [feedback objectForKey:@"flag"];
            
            if ([result isEqualToString:@"success_get_connection_recommend"]){
                self.content = [feedback objectForKey:@"connection"];
                [_tableView reloadData];
                
                CGRect frame = _connection.frame;
                frame.origin.y = 416-45;
                frame.size.height = 45;
                [_connection setFrame:frame];
                [_connection setBackgroundImage:[UIImage imageNamed:@"connectionButtonClick"] forState:UIControlStateNormal];
                
                frame = _library.frame;
                frame.origin.y = 416-39;
                frame.size.height = 39;
                [_library setFrame:frame];
                [_library setBackgroundImage:[UIImage imageNamed:@"libButton"] forState:UIControlStateNormal];
                
                [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"connectionNav"] forBarMetrics:UIBarMetricsDefault];
            }
            else {
                NSString *err_msg;
                if ([result isEqualToString:@"fail_to_get_user_by_accesstoken"]){
                    err_msg = @"授权未成功";
                }
                else if ([result isEqualToString:@"unknown_request_type"]){
                    err_msg = @"登陆类型错误";
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
}

- (void)loadLibrary{
    if (isConnection){
        isConnection = NO;
        
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
        
        NSString *path = @"EBP1/communicationAjaxAction_getAllSourceForMobile.action";
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:path parameters:params];
        
        //put request
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            [_tips hiddenLoading];
            
            NSDictionary *feedback = [[NSDictionary alloc] initWithDictionary:JSON];
            NSString *result = [feedback objectForKey:@"flag"];
            
            if ([result isEqualToString:@"success_get_all_sources"]){
                self.content = [feedback objectForKey:@"source"];
                [_tableView reloadData];
                
                CGRect frame = _connection.frame;
                frame.origin.y = 416-39;
                frame.size.height = 39;
                [_connection setFrame:frame];
                [_connection setBackgroundImage:[UIImage imageNamed:@"connectionButton"] forState:UIControlStateNormal];
                
                frame = _library.frame;
                frame.origin.y = 416-45;
                frame.size.height = 45;
                [_library setFrame:frame];
                [_library setBackgroundImage:[UIImage imageNamed:@"libButtonClick"] forState:UIControlStateNormal];
                
                [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"libNav"] forBarMetrics:UIBarMetricsDefault];

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
}


- (id)initWithData:(NSArray *)data andMainController:(MainViewController *)main{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:navFullScreenRect];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416-45)];
        _connection = [[UIButton alloc] initWithFrame:CGRectMake(0, 416-45, 160, 45)];
        _library = [[UIButton alloc] initWithFrame:CGRectMake(160, 416-39, 160, 39)];
        self.main = main;
        self.content = data;
        _tips = [[tipsAlert alloc] initWith:self.view];
        
        isConnection = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    if (isConnection){
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"connectionNav"] forBarMetrics:UIBarMetricsDefault];
    }
    else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"libNav"] forBarMetrics:UIBarMetricsDefault];
    }
    
    
    UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButtonClick"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_connection setBackgroundImage:[UIImage imageNamed:@"connectionButtonClick"] forState:UIControlStateNormal];
    [_connection addTarget:self action:@selector(loadConnection) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_connection];
    
    [_library setBackgroundImage:[UIImage imageNamed:@"libButton"] forState:UIControlStateNormal];
    [_library addTarget:self action:@selector(loadLibrary) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_library];
    
    isConnection = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setBg:nil];
    [self setConnection:nil];
    [self setLibrary:nil];
    [self setMain:nil];
    [self setContent:nil];
    [self setTips:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_tableView release];
    [_bg release];
    [_connection release];
    [_library release];
    [_main release];
    [_content release];
    [_tips release];
    [super dealloc];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (isConnection){
        return [_content count];
    }
    else {
        return [_content count]-1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isConnection){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:connection_cell];
        if (cell == nil) {
            NSArray* objects =  [[NSBundle  mainBundle] loadNibNamed:@"ConnectionCell" owner:nil options:nil];
            cell = [objects objectAtIndex:0];
        }
        NSDictionary *topic = [_content objectAtIndex:indexPath.row];
        
        UIImageView* cellBg = (UIImageView*)[cell viewWithTag:1];
        UILabel* cellTitle = (UILabel*)[cell viewWithTag:2];
        UILabel* cellContent = (UILabel*)[cell viewWithTag:3];
        
        if (indexPath.row == 0){
            [cellBg setImage:[UIImage imageNamed:@"connectionTableTop"]];
        }
        else if (indexPath.row == _content.count-1){
            [cellBg setImage:[UIImage imageNamed:@"connectionTableBottom"]];
        }
        else {
            [cellBg setImage:[UIImage imageNamed:@"connectionTable"]];
        }
        
        cellTitle.text = [NSString stringWithString:[topic objectForKey:connectionTitleKey]];
        [cellTitle setTextColor:[UIColor whiteColor]];
        [cellTitle setFont:[UIFont systemFontOfSize:13]];
        
        NSString *contentShow = [NSString stringWithString:[topic objectForKey:connectionContentKey]];
        cellContent.text = (contentShow.length < contentLength ? contentShow : [[contentShow substringToIndex:contentLength] stringByAppendingString:@"..."]);
        [cellContent setTextColor:[UIColor whiteColor]];
        [cellContent setFont:[UIFont systemFontOfSize:14]];
        cellContent.alpha = 0.7;
        cellContent.lineBreakMode = NSLineBreakByWordWrapping;
        cellContent.numberOfLines = 0;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:library_cell];
        if (cell == nil) {
            NSArray* objects =  [[NSBundle  mainBundle] loadNibNamed:@"LibraryCell" owner:nil options:nil];
            cell = [objects objectAtIndex:0];
        }
        
        NSDictionary *topic = [_content objectAtIndex:indexPath.row];
        NSDictionary *user = [[_content objectAtIndex:_content.count-1] objectAtIndex:indexPath.row];
        
        UIImageView* cellBg = (UIImageView*)[cell viewWithTag:1];
        UILabel* cellAuthor = (UILabel*)[cell viewWithTag:2];
        UILabel *cellTime = (UILabel*)[cell viewWithTag:3];
        UILabel* cellContent = (UILabel*)[cell viewWithTag:4];
        
        if (indexPath.row == 0){
            [cellBg setImage:[UIImage imageNamed:@"libTableTop"]];
        }
        else if (indexPath.row == _content.count-2){
            [cellBg setImage:[UIImage imageNamed:@"libTableBottom"]];
        }
        else {
            [cellBg setImage:[UIImage imageNamed:@"libTable"]];
        }
        
        cellAuthor.text = [NSString stringWithString:[user objectForKey:libAuthorKey]];
        [cellAuthor setTextColor:[UIColor whiteColor]];
        [cellAuthor setFont:[UIFont systemFontOfSize:13]];
        
        cellTime.text = [Utils genTimeStr:[topic objectForKey:libTimeKey]];
        [cellTime setTextColor:[UIColor whiteColor]];
        [cellTime setFont:[UIFont systemFontOfSize:13]];
        
        NSString *contentShow = [NSString stringWithString:[topic objectForKey:connectionContentKey]];
        cellContent.text = (contentShow.length < contentLength ? contentShow : [[contentShow substringToIndex:contentLength] stringByAppendingString:@"..."]);
        [cellContent setTextColor:[UIColor whiteColor]];
        [cellContent setFont:[UIFont systemFontOfSize:14]];
        cellContent.alpha = 0.7;
        cellContent.lineBreakMode = NSLineBreakByWordWrapping;
        cellContent.numberOfLines = 0;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isConnection){
        NSDictionary *topic = [_content objectAtIndex:indexPath.row];
        ConnectionViewController *connectionTopic = [[ConnectionViewController alloc] initWithTopic:topic];
        [self.navigationController pushViewController:connectionTopic animated:YES];
        [connectionTopic release];
    }
    else {
        NSDictionary *topic = [_content objectAtIndex:indexPath.row];
        NSDictionary *user = [[_content objectAtIndex:_content.count-1] objectAtIndex:indexPath.row];
        LibraryViewController *lib = [[LibraryViewController alloc] initWithSource:topic andUser:user];
        [self.navigationController pushViewController:lib animated:YES];
        [lib release];
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125.0;
}

@end
