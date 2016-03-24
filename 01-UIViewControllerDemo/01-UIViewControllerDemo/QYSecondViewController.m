//
//  QYSecondViewController.m
//  01-UIViewControllerDemo
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSecondViewController.h"

@interface QYSecondViewController ()

@end

@implementation QYSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    //创建并添加btn
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backBtn];
    //frame
    backBtn.frame = CGRectMake(200, 100, 100, 60);
    //title
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    //添加背景
    [backBtn setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5]];
    //添加事件监听（touchUpInside）
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//视图将要显示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

//视图已经显示
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

//视图将要消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

//视图已经消失
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
