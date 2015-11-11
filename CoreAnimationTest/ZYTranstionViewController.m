//
//  ZYTranstionViewController.m
//  CoreAnimationTest
//
//  Created by Stephy_xue on 15/5/27.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYTranstionViewController.h"

@interface ZYTranstionViewController ()

@end

@implementation ZYTranstionViewController

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
    NSLog(@"123");
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 50;
    
    // 设置阴影的透明度  不透明
    btn.layer.shadowOpacity = 1;
    // 阴影的颜色
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    // 阴影中心点的偏移量
    btn.layer.shadowOffset = CGSizeMake(5, 10);
    //阴影半径
    btn.layer.shadowRadius = 10;
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)btnClick
{
    // CATransition转场动画:用于视图之间切换
    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    // 动画速度
    // Linear 直线的 匀速的
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    // 动画类型
    // @"cube" 私有API  只有苹果内部才能使用
    // 代码中如果含有私有API 审核是不能通过的，不能发布
    // 私有API都是试出来的
    transition.type = @"cube";
    // 子类型 (控制上下左右方向)
    transition.subtype = kCATransitionFromLeft;
    // 交换子视图 0 1 的先后顺序无影响
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    // 把动画添加给图层
    // 核心动画显示  都是把动画加到图层上
    [self.view.layer addAnimation:transition forKey:@"key"];
    
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
