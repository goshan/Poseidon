//
//  Util.h
//  Kecheng
//
//  Created by tian li on 2/21/12.
//  Copyright (c) 2012 CreatingEV. All rights reserved.
//




#define allFullScreenRect CGRectMake(0, 0, 320, 480)
#define statusFullScreenRect CGRectMake(0, 20, 320, 460)
#define navFullScreenRect CGRectMake(0, 64, 320, 416)

#define allFullScreenSize CGSizeMake(320, 480)
#define statusFullScreenSize CGSizeMake(320, 460)
#define navFullScreenSize CGSizeMake(320, 416)

#define allFullScreenY 0
#define statusFullScreenY 20
#define navFullScreenY 64

#define mainPageBlinkCycle 1.8
#define mainPageHiddenTime 1.0

#define loadingFinishedAnimate 0.5


extern NSString *const SERVER_URL;


@interface Util : NSObject

@end

