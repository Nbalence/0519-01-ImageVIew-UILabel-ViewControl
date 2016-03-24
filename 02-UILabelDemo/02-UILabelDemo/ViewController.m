//
//  ViewController.m
//  02-UILabelDemo
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 60)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor lightGrayColor];
    
    //text
    label.text = @"你好，1601,青云中最棒！hello,world";
    label.textColor = [UIColor blueColor];
    //阴影
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(5, 5);
    //对齐方式
    label.textAlignment = NSTextAlignmentCenter;
    
    //高亮的文本颜色
    label.highlightedTextColor = [UIColor greenColor];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeLabelState:) userInfo:label repeats:YES];
    //换行方式
    label.lineBreakMode = NSLineBreakByClipping;
    
    //行数(0代表不限制行数)
    label.numberOfLines = 1;
    
    //根据label的大小来自动调节字体的大小
    label.adjustsFontSizeToFitWidth = YES;
    //label的最小的字体大小
    label.minimumScaleFactor = 10;
    
    
    
    
    UILabel *scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 100, 40)];
    [self.view addSubview:scrollLabel];
    scrollLabel.text = @"1601最棒！！！";
    scrollLabel.adjustsFontSizeToFitWidth = YES;
    scrollLabel.backgroundColor = [UIColor grayColor];
    
    
    
//    [UIView animateWithDuration:1 animations:^{
//        scrollLabel.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 300, 100, 40);
//    }];
    
//    [UIView animateWithDuration:1 animations:^{
//        scrollLabel.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 300, 100, 40);
//    } completion:^(BOOL finished) {
//        scrollLabel.frame = CGRectMake(0, 300, 100, 40);
//    }];
//    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        scrollLabel.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 300, 100, 40);
    } completion:^(BOOL finished) {
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changeLabelState:(NSTimer *)timer{
    UILabel *label = timer.userInfo;
    label.highlighted = !label.highlighted;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
