//
//  HzViewController.m
//  ColumnStyleText
//
//  Created by 何 峙 on 13-9-4.
//  Copyright (c) 2013年 何 峙. All rights reserved.
//

#import "HzViewController.h"
#import "HzTextBaseView.h"

@interface HzViewController ()

@property (nonatomic, retain) IBOutlet HzTextBaseView *pageView;

@end

@implementation HzViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSString *content = [dict objectForKey:@"content"];
    
    _pageView.contentText = content;
    _pageView.font = [UIFont systemFontOfSize:20.0f];
    [_pageView buildColumns];
    
    [dict release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    self.pageView = nil;
    
    [super dealloc];
}

@end
