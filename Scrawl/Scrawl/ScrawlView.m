//
//  ScrawlView.m
//  Scrawl
//
//  Created by Apple on 2017/4/12.
//  Copyright © 2017年 SECO. All rights reserved.
//

#import "ScrawlView.h"

@interface ScrawlView()
@property (nonatomic,strong)UIBezierPath *oneDrawPath;         //记录某一次的路径绘制
@property (nonatomic,strong)NSMutableArray *allPathArray;  //用来记录当前触摸的所有点

@end



@implementation ScrawlView

{
    }
/*
 用户在屏幕上触摸滑动的时候 每次都会触发- (void)drawRect:(CGRect)rect方法来将点绘制出来
 
 */
- (void)drawRect:(CGRect)rect {
    
    //将数组中的所有的点绘制出来
    for (UIBezierPath *path in self.allPathArray) {
        
        UIColor *color = nil;
        if (_scrawlColor) {
            color =_scrawlColor;
        }else{
            color = [UIColor redColor];
        }
        [color set];
        [path stroke];
    }
}

/*
 每次触摸屏幕,生成一个记录路径的UIBezierPath
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _oneDrawPath = [UIBezierPath bezierPath];
    [_oneDrawPath setLineWidth:5];
    [_oneDrawPath moveToPoint:point];
    [self.allPathArray addObject:_oneDrawPath];
    
}
/*
 结合生成的path,将移动轨迹绘制出来
 */

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [_oneDrawPath addLineToPoint:point];
    [self setNeedsDisplay];
    
}

/*
 根据当前view的大小,从上下文内容得出图片
 */
- (UIImage *)getScrawlImage{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/*
    将存储的数组初始化
 */
- (NSMutableArray *)allPathArray{
    if (!_allPathArray) {
        _allPathArray = [NSMutableArray array];
    }
    return _allPathArray;
}
@end
