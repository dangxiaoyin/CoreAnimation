//
//  ZYTranscationViewController.m
//  CoreAnimationTest
//
//  Created by Stephy_xue on 15/5/27.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYTranscationViewController.h"

@interface ZYTranscationViewController ()

@end

@implementation ZYTranscationViewController

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
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 50;
    // 阴影透明度
    btn.layer.shadowOpacity = 1;
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    // 阴影中心点偏移量
    btn.layer.shadowOffset = CGSizeMake(5, 10);
    btn.layer.shadowRadius = 10;
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    // 创建一个图层
    layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(200, 200, 100, 100);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    // 添加图层
    [self.view.layer addSublayer:layer];
    
    // layer上加一个小layer
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(0, 0, 50, 50);
    layer1.backgroundColor = [UIColor yellowColor].CGColor;
    [layer addSublayer:layer1];
}

- (void)btnClick
{
    // CATransaction 事务动画:用来修改图层的一些基本属性
    [CATransaction begin];
    [CATransaction setAnimationDuration:2];
    
    // 旋转  Rotation
    // 绕x y z 旋转  M_PI  180
    layer.transform = CATransform3DMakeRotation(M_PI_2, 1, 1, 1);
    
    // Scale刻度 (缩放)
    // 按倍数缩放
    // 旋转和缩放不能同时使用  因为给同一个属性transform赋值
    layer.transform = CATransform3DMakeScale(2, 2, 2);
    
    // 改变位置
    layer.transform = CATransform3DMakeTranslation(-50, 200, 10);
    
//    layer.frame = CGRectMake(200, 300, 50, 50);
    
    // 提交动画
    [CATransaction commit];
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
