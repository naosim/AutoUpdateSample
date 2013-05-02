//
//  ViewController.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "ViewController.h"
#import "ServerData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // HTMLを表示する
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:ClientData.new.indexHtmlPath]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
