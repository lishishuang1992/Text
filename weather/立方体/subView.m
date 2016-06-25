//
//  subView.m
//  立方体
//
//  Created by 李世爽 on 16/1/19.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "subView.h"

@implementation subView


-(void)getString:(NSString *)a{
    self.string = [[NSString alloc] initWithFormat:@"%@",a];
    NSLog(@"111aaaaaa%@",self.string);
    //[self drawRect:CGRectMake(0, 0, 414, 736)];
    
}
-(void)getWeekString:(NSString *)a{
    self.weekString = a;
}

-(void)registerCompletion:(NSNotification *)notification{
    NSDictionary *theData = [notification userInfo];
    self.string = [theData objectForKey:@"username"];
}
-(void)registerCompletion1:(NSNotification *)notification{
    NSDictionary *theData = [notification userInfo];
    self.weekString = [theData objectForKey:@"username"];
}
-(void)drawRect:(CGRect)rect{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion1:) name:@"RegisterCompletionNotification1" object:nil];
    NSLog(@"self.string %@",self.string);
    NSArray *temperature =[self.string componentsSeparatedByString:@","];
    //NSArray *week = [[AntiCode getOneweek] componentsSeparatedByString:@","];
    //-15度
    // NSLog(@"00000%@",temperature);
    NSArray *first1 = [temperature[0] componentsSeparatedByString:@"~"];
    //NSLog(@"323234%@",first1);
    NSArray *seond = [temperature[1] componentsSeparatedByString:@"~"];
    NSArray *third = [temperature[2] componentsSeparatedByString:@"~"];
    NSArray *fourth = [temperature[3] componentsSeparatedByString:@"~"];
    NSArray *fifth = [temperature[4] componentsSeparatedByString:@"~"];
    //NSLog(@"567%@",first1);
    CGFloat maxPoint0 = [first1[1] floatValue];
    CGFloat minPoint0 = [first1[0] floatValue];
    
    CGFloat maxPoint1 = [seond[1] floatValue];
    CGFloat minPoint1 = [seond[0] floatValue];
    
    CGFloat maxPoint2 = [third[1] floatValue];
    CGFloat minPoint2 = [third[0] floatValue];
    
    CGFloat maxPoint3 = [fourth[1] floatValue];
    CGFloat minPoint3 = [fourth[0] floatValue];
    
    CGFloat maxPoint4 = [fifth[1] floatValue];
    CGFloat minPoint4 = [fifth[0] floatValue];
   
    CGContextRef ctx = UIGraphicsGetCurrentContext();//获取绘图上下文
    CGContextSetLineWidth(ctx, 3);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    const CGPoint points1[] = {CGPointMake(50, max+maxPoint0*multiple),CGPointMake(128.5,max+maxPoint1*multiple),CGPointMake(128.5,max+maxPoint1*multiple),CGPointMake(207, max+maxPoint2*multiple),CGPointMake(207, max+maxPoint2*multiple),CGPointMake(285.5, max+maxPoint3*multiple),CGPointMake(285.5, max+maxPoint3*multiple),CGPointMake(364, max+maxPoint4*multiple)};
    
    CGContextStrokeLineSegments(ctx, points1, 8);//绘制线段（默认不绘制端点）
    
    const CGPoint points2[] = {CGPointMake(50, min+minPoint0*multiple),CGPointMake(128.5, min+minPoint1*multiple),CGPointMake(128.5, min+minPoint1*multiple),CGPointMake(207,  min+minPoint2*multiple),CGPointMake(207,  min+minPoint2*multiple),CGPointMake(285.5,  min+minPoint3*multiple),CGPointMake(285.5, min+minPoint3*multiple),CGPointMake(364,  min+minPoint4*multiple)};
    
    CGContextStrokeLineSegments(ctx, points2, 8);//绘制线段（默认不绘制端点）
    
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = first1[1];
    
    label1.frame  = CGRectMake(50, max+maxPoint0*multiple - minute, 40, 40);
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor whiteColor];
    [self addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = seond[1];
    label2.frame  = CGRectMake(128.5, max+maxPoint1*multiple - minute, 40, 40);
    label2.backgroundColor = [UIColor clearColor];
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor whiteColor];
    [self addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = third[1];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label3.frame  = CGRectMake(207, max+maxPoint2*multiple - minute, 40, 40);
    label3.backgroundColor = [UIColor clearColor];
    label3.font = [UIFont systemFontOfSize:15];
    label3.textColor = [UIColor whiteColor];
    [self addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = fourth[1];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label4.frame  = CGRectMake(285.5, max+maxPoint3*multiple - minute, 40, 40);
    label4.backgroundColor = [UIColor clearColor];
    label4.font = [UIFont systemFontOfSize:15];
    label4.textColor = [UIColor whiteColor];
    [self addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] init];
    label5.text = fifth[1];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label5.frame  = CGRectMake(364, max+maxPoint4*multiple - minute, 40, 40);
    label5.backgroundColor = [UIColor clearColor];
    label5.font = [UIFont systemFontOfSize:15];
    label5.textColor = [UIColor whiteColor];
    [self addSubview:label5];
    
    UILabel *label6 = [[UILabel alloc] init];
    label6.text = first1[0];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label6.frame  = CGRectMake(50, min+minPoint0*multiple + minute, 40, 40);
    label6.backgroundColor = [UIColor clearColor];
    label6.font = [UIFont systemFontOfSize:15];
    label6.textColor = [UIColor whiteColor];
    [self addSubview:label6];
    
    UILabel *label7 = [[UILabel alloc] init];
    label7.text = seond[0];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label7.frame  = CGRectMake(128.5, min+minPoint1*multiple + minute, 40, 40);
    label7.backgroundColor = [UIColor clearColor];
    label7.font = [UIFont systemFontOfSize:15];
    label7.textColor = [UIColor whiteColor];
    [self addSubview:label7];
    
    UILabel *label8 = [[UILabel alloc] init];
    label8.text = third[0];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label8.frame  = CGRectMake(207, min+minPoint2*multiple + minute, 40, 40);
    label8.backgroundColor = [UIColor clearColor];
    label8.font = [UIFont systemFontOfSize:15];
    label8.textColor = [UIColor whiteColor];
    [self addSubview:label8];
    
    UILabel *label9 = [[UILabel alloc] init];
    label9.text = fourth[0];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label9.frame  = CGRectMake(285.5, min+minPoint3*multiple + minute, 40, 40);
    label9.backgroundColor = [UIColor clearColor];
    label9.font = [UIFont systemFontOfSize:15];
    label9.textColor = [UIColor whiteColor];
    [self addSubview:label9];
    
    UILabel *label10 = [[UILabel alloc] init];
    label10.text = first1[0];
    //NSLog(@"1111%@  %@",first1[0],first1[1]);
    label10.frame  = CGRectMake(364, min+minPoint4*multiple + minute, 40, 40);
    label10.backgroundColor = [UIColor clearColor];
    label10.font = [UIFont systemFontOfSize:15];
    label10.textColor = [UIColor whiteColor];
    [self addSubview:label10];
    
    
    UITextField *textfield = [[UITextField alloc] init];
    NSLog(@"1212341341534514%@",self.weekString);
    textfield.text =  self.weekString;
    textfield.frame = CGRectMake(10, 600, 400, 40);
    textfield.backgroundColor = [UIColor clearColor];
    textfield.font = [UIFont systemFontOfSize:20];
    [self addSubview:textfield];
    
    //[self.geomView ]
    
    
}

@end
