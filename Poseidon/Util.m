//
//  Util.m
//  Kecheng
//
//  Created by tian li on 2/21/12.
//  Copyright (c) 2012 CreatingEV. All rights reserved.
//

#import "Util.h"

#if TARGET_IPHONE_SIMULATOR
NSString* const SERVER_URL = @"http://localhost:3000";
#else
NSString* const SERVER_URL = @"http://easy-follow.com";
#endif


@implementation Util

@end
