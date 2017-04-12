//
//  ViewController.m
//  Scrawl
//
//  Created by Apple on 2017/4/12.
//  Copyright © 2017年 SECO. All rights reserved.
//

#import "ViewController.h"
#import "ScrawlView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ScrawlView *scrawlView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"涂鸦或签名并截图";
    //可以修改绘制的颜色 随时可以修改,
    _scrawlView.scrawlColor = [UIColor redColor];
}
- (IBAction)makeImage:(id)sender {

    _imageView.image = [_scrawlView getScrawlImage];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
