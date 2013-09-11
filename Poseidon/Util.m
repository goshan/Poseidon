//
//  Util.m
//  Kecheng
//
//  Created by tian li on 2/21/12.
//  Copyright (c) 2012 CreatingEV. All rights reserved.
//

#import "Util.h"


NSString* const SERVER_URL = @"http://9.123.148.201:8080";



@implementation Utils


+ (NSString *)genTimeStr:(NSDictionary *)time{
    NSTimeInterval interval = [[time objectForKey:@"time"] intValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm yyyy/MM/dd"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    return timeStr;
}

+ (NSString *)getServerURL{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *url = [defaults objectForKey:@"server_url"];
    return (url && ![url isEqualToString:@""] ? url : SERVER_URL);
}

+ (void) saveServerURL:(NSString *)url{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"http://%@", url] forKey:@"server_url"];
}

@end
