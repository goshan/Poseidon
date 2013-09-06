//
//  Util.h
//  Kecheng
//
//  Created by tian li on 2/21/12.
//  Copyright (c) 2012 CreatingEV. All rights reserved.
//



//size

#define allFullScreenRect CGRectMake(0, 0, 320, 480)
#define statusFullScreenRect CGRectMake(0, 0, 320, 460)
#define navFullScreenRect CGRectMake(0, 0, 320, 416)

#define allFullScreenSize CGSizeMake(320, 480)
#define statusFullScreenSize CGSizeMake(320, 460)
#define navFullScreenSize CGSizeMake(320, 416)

#define allFullScreenY 0
#define statusFullScreenY 20
#define navFullScreenY 64

#define contentLength 50

#define connectionDetailsContentHeightMin 100

//time
#define mainPageBlinkCycle 1.8
#define mainPageHiddenTime 1.0

#define loadingFinishedAnimate 0.5


//key
#define userToken @"poseidon_token"
#define connectionTitleKey @"title"
#define connectionContentKey @"content"
#define libAuthorKey @"username"
#define libTimeKey @"created_at"
#define libContentKey @"content"


//identifier
#define connection_cell @"connection_cell_id"
#define library_cell @"library_cell_id"

//color
#define colorWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/100.0]
#define colorWithRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


extern NSString *const SERVER_URL;


@interface Utils : NSObject

+ (NSString *)genTimeStr:(NSDictionary *)time;

@end

