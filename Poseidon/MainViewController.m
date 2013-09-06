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





@implementation MainViewController

BOOL isBlink = YES;


@synthesize cover = _cover;
@synthesize button = _button;
@synthesize blinkTimer = _blinkTimer;
@synthesize login = _login;
@synthesize nav = _nav;





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
    NSString *json = @"[{\"content\":\"软件氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可氨基酸djfklajsgkljs是看过了；阿卡过来就好了就撒了就好了卡价格了的开发金卡送积分卡机是否可垃圾阿三开了房间看来是结果看了几十块了关键时刻了解对方可拉伸尽快阿娇快发快乐积分卡即可飞机上看了几个快乐撒谎的感觉卡数据库连接可拉伸感觉sjfkjaskljfklasjgkjsdklgjkl啊数据库附近阿卡丽结果看了就欧佩克感觉撒开了的更好看喇叭\",\"similarity\":1.0E9,\"title\":\"软件\",\"titleShow\":\"软件\",\"topic_id\":1430,\"uuid\":\"ffeb8156-e054-4345-bd3f-95eb3f8a290f\"},{\"content\":\" 亲爱的同事们\",\"similarity\":647137,\"title\":\"收集心愿单啦~大家有什么想看的书、期刊杂志？请跟帖~\",\"titleShow\":\"收集心愿单啦~大家有什么想看的书、期刊杂\",\"topic_id\":999,\"uuid\":\"2ba15a95-0fe2-4440-a651-fa9c3b9a58f9\"},{\"content\":\"软件\",\"similarity\":1.0E9,\"title\":\"软件\",\"titleShow\":\"软件\",\"topic_id\":1430,\"uuid\":\"ffeb8156-e054-4345-bd3f-95eb3f8a290f\"},{\"content\":\" 亲爱的同事们：是机房环境卡号福建海事局和放假撒更换即可上飞机尽快放假撒发货就卡死了回复就撒谎发几十块的法律dfkjdskfjkds刷卡就付款了按实际付款了撒房价开始\",\"similarity\":647137,\"title\":\"收集心愿单啦~大家有什么想看的书、期刊杂志？请跟帖~\",\"titleShow\":\"收集心愿单啦~大家有什么想看的书、期刊杂\",\"topic_id\":999,\"uuid\":\"2ba15a95-0fe2-4440-a651-fa9c3b9a58f9\"}]";
    
//    NSString *json = @"[{\"content\":\"【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？【2013网络流行词】何弃疗、我伙呆、人干事、不明觉厉、人艰不拆、说闹觉余、累觉不爱、火钳刘明......还有不约而同......这些2013网络流行词，你常用哪几个？\",\"created_at\":{\"date\":3,\"day\":2,\"hours\":11,\"minutes\":45,\"month\":8,\"nanos\":0,\"seconds\":9,\"time\":1378179909000,\"timezoneOffset\":-480,\"year\":113},\"source_id\":23},{\"content\":\"推荐几个免费好用的软件\",\"created_at\":{\"date\":3,\"day\":2,\"hours\":1,\"minutes\":12,\"month\":8,\"nanos\":0,\"seconds\":16,\"time\":1378141936000,\"timezoneOffset\":-480,\"year\":113},\"source_id\":24},[{\"access_token\":\"\",\"certCode\":\"\",\"email\":\"\",\"password\":\"\",\"realname\":\"\",\"type\":\"\",\"user_id\":1,\"user_info\":\"\",\"username\":\"刘紫薇\"},{\"access_token\":\"\",\"certCode\":\"\",\"email\":\"\",\"password\":\"\",\"realname\":\"\",\"type\":\"\",\"user_id\":1,\"user_info\":\"\",\"username\":\"刘的减肥垃圾是否是科技紫薇\"}]]";
    
    NSArray *feedBack = [NSJSONSerialization JSONObjectWithData: [json dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: nil];
    
    UIViewController *info;
    if ([user_type isEqualToString:@"admin"]){
        info = [[AdminViewController alloc] initWithData:feedBack andMainController:self];
    }
    else {
        info = [[UserViewController alloc] initWithData:feedBack andMainController:self];
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
    [super viewDidUnload];
}

- (void)dealloc {
    [_button release];
    [_cover release];
    [_blinkTimer release];
    [_login release];
    [super dealloc];
}

@end
