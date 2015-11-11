//
//  ZYAnimationGroupViewController.m
//  CoreAnimationTest
//
//  Created by Stephy_xue on 15/5/27.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYAnimationGroupViewController.h"

@interface ZYAnimationGroupViewController ()

@end

@implementation ZYAnimationGroupViewController

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
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 60, 40, 40)];
    imageView.image = [UIImage imageNamed:@"123"];
    imageView.layer.cornerRadius = 20;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 往下掉落的过程中能够自动旋转, 还会变大,弹起的时候变小.
    
    // 1,旋转
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:10 * 360 * M_PI / 180];

    
    // 位置移动
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 160 80
    // 160 380
    // 160 200
    // 160 380
    // 160 300
    // 160 380
    positionAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(160, 80)],[NSValue valueWithCGPoint:CGPointMake(160, 380)],[NSValue valueWithCGPoint:CGPointMake(160, 200)],[NSValue valueWithCGPoint:CGPointMake(160, 380)],[NSValue valueWithCGPoint:CGPointMake(160, 300)],[NSValue valueWithCGPoint:CGPointMake(160, 380)]];
    positionAnimation.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.4],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1]];
    
    // 缩放
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    // 1
    // 2
    // 1.3
    // 2
    // 1.7
    // 2
    scaleAnimation.values = @[[NSNumber numberWithFloat:1],[NSNumber numberWithFloat:2],[NSNumber numberWithFloat:1.3],[NSNumber numberWithFloat:2],[NSNumber numberWithFloat:1.7],[NSNumber numberWithFloat:2]];
    scaleAnimation.keyTimes = @[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.4],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1]];
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotationAnimation,positionAnimation,scaleAnimation];
    group.duration = 5;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:group forKey:@"group"];
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
