//
//  ZYKeyFrameViewController.m
//  CoreAnimationTest
//
//  Created by Stephy_xue on 15/5/27.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYKeyFrameViewController.h"

@interface ZYKeyFrameViewController ()

@end

@implementation ZYKeyFrameViewController

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
    
    layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(140, 80, 60, 60);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 30;
    [self.view.layer addSublayer:layer];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // CAKeyFrameAnimation 关键帧动画:可以控制图层在动画过程中每一个状态的值
    
    
    /*
     // position 位置 指定中心点的位置
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 40 110
    // 280  110
    // 130  110
    // 200  110
    
     // values 是一个数组类型的属性
    keyFrame.values = @[[NSValue valueWithCGPoint:CGPointMake(30, 100)],[NSValue valueWithCGPoint:CGPointMake(300, 100)],[NSValue valueWithCGPoint:CGPointMake(200, 100)],[NSValue valueWithCGPoint:CGPointMake(250, 100)]];
    
     // keyTimes 是数组类型的属性
     // time 从0开始  1结尾
    keyFrame.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:1]];
    
    keyFrame.duration = 2;
    
    // 动画做完之后不移除动画效果
    keyFrame.removedOnCompletion = NO;
    // 保持最新的动画状态
    keyFrame.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:keyFrame forKey:@"key"];
    */
    
    // 刻度（缩放）
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    // 1
    // 0.8
    // 1.2
    // 1
    
    keyFrame.values = @[[NSNumber numberWithFloat:1],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:1]];
    
    //
    keyFrame.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:1]];
    
    keyFrame.duration = 0.5;
    
    // 动画做完之后不移除动画效果
    keyFrame.removedOnCompletion = NO;
    // 保持最新的动画状态
    keyFrame.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:keyFrame forKey:@"key"];
    
    
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
