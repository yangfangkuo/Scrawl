//
//  ScrawlView.h
//  Scrawl
//
//  Created by Apple on 2017/4/12.
//  Copyright © 2017年 SECO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrawlView : UIView
/*
 手势涂鸦或者绘制的颜色
 */
@property (nonatomic,strong)UIColor *scrawlColor;
/*
 获取当前的屏幕绘制的图片
 */
- (UIImage *)getScrawlImage;
@end
