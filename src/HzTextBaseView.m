//
//  HzTextBaseView.m
//  ColumnStyleText
//
//  Created by 何 峙 on 13-9-4.
//  Copyright (c) 2013年 何 峙. All rights reserved.
//

#import "HzTextBaseView.h"
#import <CoreText/CoreText.h>
#import "HzColumnView.h"


@implementation HzTextBaseView

- (id)initWithAttributedString:(NSAttributedString *)aString{
    self = [super init];
    if(self){
        self.attributedString = aString;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc{
    self.frames= nil;
    self.attributedString = nil;
    
    [super dealloc];
}

#pragma mark - Public methods

- (void)buildColumns{
    CGFloat frameXOffset = 20.0f;
    CGFloat frameYOffset = 20.0f;
    self.pagingEnabled = YES;
    //self.delegate = self;
    self.frames = [NSMutableArray array];
    
    CGRect textFrame = CGRectInset(self.bounds, frameXOffset, frameYOffset);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)_attributedString);

    NSInteger textPos = 0;
    NSInteger columnIndex = 0;
    while(textPos < _attributedString.length){
        CGPoint columnOffSet = CGPointMake((columnIndex + 1) * frameXOffset + columnIndex * textFrame.size.width / 2, 20.0f);
        CGRect columnRect = CGRectMake(0.0f, 0.0f, textFrame.size.width / 2 - 10, textFrame.size.height - 10);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, columnRect);
        
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(textPos, 0), path, NULL);
        CFRelease(path);
        CFRange frameRange = CTFrameGetVisibleStringRange(frame);
        
        HzColumnView *columnView = [[HzColumnView alloc] initWithCTFrame:frame];
        columnView.backgroundColor = [UIColor clearColor];
        columnView.frame = CGRectMake(columnOffSet.x, columnOffSet.y, columnRect.size.width, columnRect.size.height);
        [self addSubview:columnView];
        [columnView release];
        
        [_frames addObject:(id)frame];
        
        textPos += frameRange.length;
        columnIndex++;
    }
    
    NSInteger totalPages = (columnIndex + 1) / 2;
    self.contentSize = CGSizeMake(totalPages * self.bounds.size.width, textFrame.size.height);
}

@end
