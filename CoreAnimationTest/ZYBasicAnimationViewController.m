//
//  ZYBasicAnimationViewController.m
//  CoreAnimationTest
//
//  Created by Stephy_xue on 15/5/27.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYBasicAnimationViewController.h"

@interface ZYBasicAnimationViewController ()

@end

@implementation ZYBasicAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 50;
    btn.layer.shadowOpacity = 1;
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowOffset = CGSizeMake(5, 10);
    btn.layer.shadowRadius = 10;
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(200, 200, 100, 100);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(0, 0, 50, 50);
    layer1.backgroundColor = [UIColor yellowColor].CGColor;
    [layer addSublayer:layer1];
}

- (void)btnClick
{
    // CABasicAnimation 基础动画 可以控制图层的某一个属性 每次改变多少
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 从什么状态开始
    basic.fromValue = [NSNumber numberWithFloat:0.8];
    
    // 增量
//    basic.byValue = [NSNumber numberWithFloat:360 * M_PI / 180];
    
    // 最终状态
    basic.toValue = [NSNumber numberWithFloat:1.5];
    
    // 总时间
    basic.duration = 0.2;
    
    // 重复的次数
//    basic.repeatCount = 10;
    
    // 重复多长时间
    basic.repeatDuration = 10;
    
    // 动画做完之后 是否返回过来
    basic.autoreverses = YES;
    
    // 匀速
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [layer addAnimation:basic forKey:@"key"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
