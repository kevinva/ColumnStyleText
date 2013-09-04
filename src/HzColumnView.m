//
//  HzColumnView.m
//  ColumnStyleText
//
//  Created by 何 峙 on 13-9-4.
//  Copyright (c) 2013年 何 峙. All rights reserved.
//

#import "HzColumnView.h"

@interface HzColumnView ()

@property (nonatomic) CTFrameRef textCTFrame;

@end

@implementation HzColumnView

- (id)initWithCTFrame:(CTFrameRef)ctFrame{
    self = [super init];
    if(self){
        self.textCTFrame = ctFrame;
    }
    
    return self;
}


- (void)setCtFrame:(CTFrameRef)ctFrame{
    if(ctFrame != _textCTFrame){
        if(_textCTFrame){
            CFRelease(_textCTFrame);
        }
        _textCTFrame = ctFrame;
        
        if(_textCTFrame){
            CFRetain(_textCTFrame);
        }
    }
}

- (CTFrameRef)textCTFrame{
    return _textCTFrame;
}

- (void)dealloc{
    self.textCTFrame = nil;
    
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    CTFrameDraw(_textCTFrame, context);
}


@end
