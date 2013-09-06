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




BOOL isConnection = YES;

@implementation AdminViewController

@synthesize tableView = _tableView;
@synthesize bg = _bg;
@synthesize connection = _connection;
@synthesize library = _library;
@synthesize main = _main;
@synthesize content = _content;





- (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:userToken];
    
    [_main logoutViewSwitch];
}

- (void)loadConnection{
    if (!isConnection){
        isConnection = YES;
        
        NSString *json = @"[{\"content\":\"软件氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可飞机上看了几个快乐撒谎的感觉卡数据库连接可拉伸感觉sjfkjaskljfklasjgkjsdklgjkl啊数据库附近阿卡丽结果看了就欧佩克感觉撒开了的更好看喇叭\",\"similarity\":1.0E9,\"title\":\"软件\",\"titleShow\":\"软件\",\"topic_id\":1430,\"uuid\":\"ffeb8156-e054-4345-bd3f-95eb3f8a290f\"},{\"content\":\" 亲爱的同事们\",\"similarity\":647137,\"title\":\"收集心愿单啦~大家有什么想看的书、期刊杂志？请跟帖~\",\"titleShow\":\"收集心愿单啦~大家有什么想看的书、期刊杂\",\"topic_id\":999,\"uuid\":\"2ba15a95-0fe2-4440-a651-fa9c3b9a58f9\"},{\"content\":\"软件\",\"similarity\":1.0E9,\"title\":\"软件\",\"titleShow\":\"软件\",\"topic_id\":1430,\"uuid\":\"ffeb8156-e054-4345-bd3f-95eb3f8a290f\"},{\"content\":\" 亲爱的同事们：是机房环境卡号福建海事局和放假撒更换即可上飞机尽快放假撒发货就卡死了回复就撒谎发几十块的法律dfkjdskfjkds刷卡就付款了按实际付款了撒房价开始\",\"similarity\":647137,\"title\":\"收集心愿单啦~大家有什么想看的书、期刊杂志？请跟帖~\",\"titleShow\":\"收集心愿单啦~大家有什么想看的书、期刊杂\",\"topic_id\":999,\"uuid\":\"2ba15a95-0fe2-4440-a651-fa9c3b9a58f9\"}]";
        
        NSArray *feedBack = [NSJSONSerialization JSONObjectWithData: [json dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: nil];
        self.content = feedBack;
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
}

- (void)loadLibrary{
    if (isConnection){
        isConnection = NO;
        
        NSString *json = @"[{\"content\":\"【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？\",\"created_at\":{\"date\":3,\"day\":2,\"hours\":11,\"minutes\":45,\"month\":8,\"nanos\":0,\"seconds\":9,\"time\":1378179909000,\"timezoneOffset\":-480,\"year\":113},\"source_id\":23},{\"content\":\"推荐几个免费好用的软件\",\"created_at\":{\"date\":3,\"day\":2,\"hours\":1,\"minutes\":12,\"month\":8,\"nanos\":0,\"seconds\":16,\"time\":1378141936000,\"timezoneOffset\":-480,\"year\":113},\"source_id\":24},[{\"access_token\":\"\",\"certCode\":\"\",\"email\":\"\",\"password\":\"\",\"realname\":\"\",\"type\":\"\",\"user_id\":1,\"user_info\":\"\",\"username\":\"刘紫薇\"},{\"access_token\":\"\",\"certCode\":\"\",\"email\":\"\",\"password\":\"\",\"realname\":\"\",\"type\":\"\",\"user_id\":1,\"user_info\":\"\",\"username\":\"刘的减肥垃圾是否是科技紫薇\"}]]";
        
        NSArray *feedBack = [NSJSONSerialization JSONObjectWithData: [json dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: nil];
        self.content = feedBack;
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
    [super viewDidUnload];
}

- (void)dealloc {
    [_tableView release];
    [_bg release];
    [_connection release];
    [_library release];
    [_main release];
    [_content release];
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
        [cellContent sizeToFit];
        
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
        [cellContent sizeToFit];
        
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
