//
//  gTextArea.m
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "gTextArea.h"

@implementation gTextArea

@synthesize bg = _bg;
@synthesize text = _text;


- (id)initWithFrame:(CGRect)frame andMarginLeft:(CGFloat)margin
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        frame.origin.x = 0;
        frame.origin.y = 0;
        _bg = [[UIImageView alloc] initWithFrame:frame];
        
        frame.origin.x += margin;
        frame.size.width -= 2*margin;
        frame.origin.y += margin;
        frame.size.height -= 2*margin;
        _text = [[UITextView alloc] initWithFrame:frame];
    }
    return self;
}

- (void) setFont:(UIFont *)font{
    [_text setFont:font];
}

- (void) setAlpha:(CGFloat)alpha{
    [_text setAlpha:alpha];
}

- (void)setTextColor:(UIColor *)color{
    [_text setTextColor:color];
}

- (void) setbackgroundImage:(UIImage *)backgroundImage{
    [_bg setImage:backgroundImage];
}

- (void) setTextContent:(NSString *)content{
    _text.text = content;
}

- (NSString *) getTextContent{
    return _text.text;
}

- (void)setDelegate:(id<UITextViewDelegate>) delegate{
    _text.delegate = delegate;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self addSubview:_bg];
    
    [_text setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_text];
}


- (void)dealloc {
    [_bg release];
    [_text release];
    [super dealloc];
}

@end
