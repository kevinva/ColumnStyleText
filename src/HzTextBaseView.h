//
//  HzTextBaseView.h
//  ColumnStyleText
//
//  Created by 何 峙 on 13-9-4.
//  Copyright (c) 2013年 何 峙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HzTextBaseView : UIScrollView

@property (nonatomic, retain) NSString *contentText;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, assign) CGFloat lineSpace;


- (void)buildColumns;

@end
