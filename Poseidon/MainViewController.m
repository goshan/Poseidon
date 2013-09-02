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





@implementation MainViewController

BOOL isBlink = YES;


@synthesize cover = _cover;
@synthesize button = _button;
@synthesize blinkTimer = _blinkTimer;





- (void) starBlink{
    [gAnimation makeView:_button blinkWithDuration:mainPageBlinkCycle];
}

- (void)makeViewBlink{
    if (isBlink){
        [self starBlink];
        _blinkTimer = [NSTimer scheduledTimerWithTimeInterval:mainPageBlinkCycle target:self selector:@selector(starBlink) userInfo:nil repeats:YES];
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
    [gAnimation moveView:self.view toFinalFrame:CGRectMake(0, -500, 320, 460) withDuration:mainPageHiddenTime];
    [self performSelector:@selector(showStatusBar)withObject:nil afterDelay:mainPageHiddenTime];
    [self removeFromParentViewController];
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _cover = [[UIImageView alloc] initWithFrame:allFullScreenRect];
    [_cover setImage:[UIImage imageNamed:@"banner"]];
    UISwipeGestureRecognizer *gesture = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenCover)] autorelease];
    [gesture setDirection:UISwipeGestureRecognizerDirectionUp];
    //[_cover addGestureRecognizer:gesture];
    [self.view addSubview:_cover];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(136, 480-48, 48, 48)];
    [_button setImage:[UIImage imageNamed:@"motion"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(hiddenCover) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    [self.view addGestureRecognizer:gesture];
    [self makeViewBlink];
    // Do any additional setup after loading the view from its nib.
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
    [super viewDidUnload];
}

- (void)dealloc {
    [_button release];
    [_cover release];
    [_blinkTimer release];
    [super dealloc];
}

@end
