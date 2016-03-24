//
//  ViewController.m
//  03-UIImageViewDemo
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)changeImageHighlightedState{
    UIImageView *imageView = [self.view viewWithTag:101];
    imageView.highlighted = !imageView.highlighted;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if 0
    UIImage *image = [UIImage imageNamed:@"dog1"];
    UIImage *highlightedImage = [UIImage imageNamed:@"dog2"];
    //创建并添加imageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
    [self.view addSubview:imageView];
    //frame
    imageView.frame = CGRectMake(100, 100, 100, 100);
    imageView.tag = 101;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeImageHighlightedState) userInfo:nil repeats:YES];
#else
   //添加火焰视图
    UIImageView *fireView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:fireView];
    
    //创建一个可变数组，存储图片
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 17; i++) {
        //注意，图片格式非png的话，需要指定后缀名
        NSString *imageName = [NSString stringWithFormat:@"campFire%02d.gif",i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    //设置帧动画数组
    fireView.animationImages = images;
    //设置动画时间
    fireView.animationDuration = 1;
    //重复次数(0代表无限)
    fireView.animationRepeatCount = 0;
    //启动动画
    [fireView startAnimating];
    
#endif
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(flySnow) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)flySnow{
    //创建雪花
    UIImage *snow = [UIImage imageNamed:@"flake"];
    UIImageView *snowView = [[UIImageView alloc] initWithImage:snow];
    [self.view addSubview:snowView];
    //设置起始位置
    int screenW = [UIScreen mainScreen].bounds.size.width;
    //雪花的起始X
    int x1 = arc4random() % screenW;
    //雪花的随机倍数
    double scale = 1.0 + (arc4random() % 100) / 100.0;
    snowView.frame = CGRectMake(x1, -(30 * scale), 30 * scale, 30 * scale);
   
    //动画时间随机倍数
    double durationScale = 1.0 + (arc4random() % 100) / 100.0;
    
    //设置结束位置
    [UIView animateWithDuration:5 * durationScale animations:^{
        //雪花最终的随机倍数
        double scale2 = 1.0 + (arc4random() % 100) / 100.0;
        int x2 = arc4random() % screenW;
        int screenH = [UIScreen mainScreen].bounds.size.height;
        snowView.frame = CGRectMake(x2, screenH - 20 *scale2, 20 * scale2, 20 * scale2);
    } completion:^(BOOL finished) {
        [snowView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
