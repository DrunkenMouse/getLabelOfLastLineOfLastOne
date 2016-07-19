//
//  ViewController.m
//  获取Label的最后一个字符位置
//
//  Created by 王奥东 on 16/6/30.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"这里是测试Label的宽高与图标能否显示的信息";
    label.textColor = [UIColor blackColor];
//    label.backgroundColor = [UIColor blackColor];
    [label setFont:[UIFont systemFontOfSize:14]];
    label.numberOfLines = 0;
    
    
    //最后一个点
    CGPoint lastPoint = CGPointMake(0, 0);
    //
    CGSize sz = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, 40)];
    
    CGSize linesSz = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    
    
    label.frame = CGRectMake(100, 100, sz.width, sz.height);
    if(sz.width <= linesSz.width) //判断是否折行
        
    {
        
        lastPoint = CGPointMake(label.frame.origin.x + sz.width,     label.frame.origin.y);
        
    }
    
    else
        
    {
        
        lastPoint = CGPointMake(label.frame.origin.x + (int)sz.width % (int)linesSz.width,linesSz.height - sz.height);
        
    }
    
    NSLog(@"%f,%f",lastPoint.x,lastPoint.y);
    [self.view addSubview:label];
    
    [self.view addSubview:label];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(lastPoint.x, lastPoint.y, 30, 30)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
//    
//    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
//    textView.backgroundColor = [UIColor orangeColor];
//    textView.editable = YES;
//    
//    [self.view addSubview:textView];
    
    
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
