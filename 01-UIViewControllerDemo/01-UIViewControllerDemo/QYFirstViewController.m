//
//  QYFirstViewController.m
//  01-UIViewControllerDemo
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirstViewController.h"
#import "QYSecondViewController.h"
@interface QYFirstViewController ()

@end

@implementation QYFirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}


//注意重写loadView方法，执行完之后要确保self.view不为nil，（给视图控制器一个非普通的view）
-(void)loadView{
#if 1
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = [UIColor blueColor];
    tempView.alpha = 0.5;
    self.view = tempView;
    
    
#else
    //把webView设置成当前视图控制器的根视图
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    //把tableView设置当前视图控制器的根视图
    UITableView *tableView = [[UITableView alloc] init];
    self.view = tableView;
#endif
    
    NSLog(@"%s",__func__);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%@",self.view);
    NSLog(@"%s",__func__);
    //创建并添加btn
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextBtn];
    //frame
    nextBtn.frame = CGRectMake(100, 100, 100, 60);
    //title
    [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    //添加背景
    [nextBtn setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5]];
    //添加事件监听（touchUpInside）
    [nextBtn addTarget:self action:@selector(nextPageVC:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)nextPageVC:(UIButton *)btn{
    QYSecondViewController *secondVC = [[QYSecondViewController alloc] init];
    //使用模态方式
    [self presentViewController:secondVC animated:YES completion:nil];
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
