//
//  HzTextBaseView.h
//  ColumnStyleText
//
//  Created by 何 峙 on 13-9-4.
//  Copyright (c) 2013年 何 峙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HzTextBaseView : UIScrollView

@property (nonatomic, retain) NSMutableArray *frames;
@property (nonatomic, retain) NSAttributedString *attributedString;

- (id)initWithAttributedString:(NSAttributedString *)aString;
- (void)buildColumns;

@end
