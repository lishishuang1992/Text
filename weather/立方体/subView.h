//
//  subView.h
//  立方体
//
//  Created by 李世爽 on 16/1/19.
//  Copyright © 2016年 李世爽. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AntiCode.h"

#define multiple 8
#define max 200
#define min 536
#define minute 50
@interface subView : UIView
@property(nonatomic,strong)NSString *string;
@property(nonatomic,strong)NSString *weekString;
-(void)getString:(NSString *)a;
-(void)getWeekString:(NSString *)a;
@end