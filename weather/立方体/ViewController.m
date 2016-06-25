//
//  ViewController.m
//  立方体
//
//  Created by 李世爽 on 16/1/18.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "ViewController.h"
#import "subView.h"

@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocation *currentLocation;
    AntiCode *we ;
    BOOL done;
    subView *sub;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //定位服务管理对象初始化
    sub = [[subView alloc] init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000.0f;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(refresh) object:nil];
    [thread start];
    
}

-(void) refresh
{
    done=YES;
    do
    {
        if (currentLocation) {
            we = [[AntiCode alloc] init];
            [we code:currentLocation];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textView.text = [we todayhealth];
                self.textViewFuture.text = [we futurehealth];
                self.imageToday.image = [UIImage imageNamed:[we weatherForImage:we.todayWeatherImage]];
                NSArray *array = [we.weathers componentsSeparatedByString:@","];
                self.futuerImage.image = [UIImage imageNamed:[we weatherForImage:array[0]]];
                self.futuerImage1.image = [UIImage imageNamed:[we weatherForImage:array[1]]];
                self.futuerImage2.image = [UIImage imageNamed:[we weatherForImage:array[2]]];
                self.futuerImage3.image = [UIImage imageNamed:[we weatherForImage:array[3]]];
                self.futuerimage4.image = [UIImage imageNamed:[we weatherForImage:array[4]]];
                [sub getString:[we getQuxian]];
                NSLog(@"12121%@   %@",[we getQuxian],[we getWeekString]);
                //[we getWeekString];
                
                NSDictionary *dataDict = [NSDictionary dictionaryWithObject:[we getQuxian] forKey:@"username"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
                NSDictionary *dataDict1 = [NSDictionary dictionaryWithObject:[we getWeekString] forKey:@"username"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification1" object:nil userInfo:dataDict1];
    
            });
            done=NO;
        }
        NSLog(@"访问中");
        [NSThread sleepForTimeInterval:1];
    }while (done);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //停止定位
    [self.locationManager stopUpdatingLocation];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Core Location委托方法用于实现位置的更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations lastObject];
}




- (IBAction)bn0:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view bringSubviewToFront:self.secondView];
    NSLog(@"0");
}
- (IBAction)bn1:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view bringSubviewToFront:self.grayView];
    NSLog(@"1");
}
- (IBAction)bn2:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view bringSubviewToFront:self.lastView];
    NSLog(@"2");
    
}
- (IBAction)bn3:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view bringSubviewToFront:self.magentaView];

    [self.subView1 setNeedsDisplay];
    NSLog(@"3");
}
- (IBAction)cityButton:(id)sender {
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"吉林",@"1",@"松原市",@"2",@"哈尔滨市",@"3",@"佳木斯市",@"4",@"白城市",@"5",@"通化市",@"6",@"五常市",@"7",@"",@"8",@"中雨",@"9",@"晴",@"10",@"暴雨",@"11",@"大暴雨",@"12",@"特大暴雨",@"13",@"阵雪",@"14",@"小雪",@"15",@"中雪",@"16",@"大雪",@"17",@"暴雪",@"18",@"雾",@"19",@"冻雨",@"20",@"沙尘暴",@"21",@"小雨转中雨",@"22",@"中雨转大雨",@"23",@"大雨转暴雨",@"24",@"暴雨转大暴雨",@"25",@"大暴雨转特大暴雨",@"26",@"小雪转中雪",@"27",@"中雪转大雪",@"28",@"大雪转暴雪",@"29",@"浮尘",@"30",@"扬沙",@"31",@"强沙尘暴",@"nothing",@"没有数据", nil];
    NSString *string = [dict objectForKey:self.textFiled.text];
    if (string == nil) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"城市名输入有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"请重新输入" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            self.textFiled.text = nil;
        }];
        [alertController addAction:noAction];
        [self presentViewController:alertController animated:YES completion:nil];

    }else{
        [we city:self.textFiled.text];
        self.textView.text = [we todayhealth];
        self.textViewFuture.text = [we futurehealth];
        self.imageToday.image = [UIImage imageNamed:[we weatherForImage:we.todayWeatherImage]];
        NSArray *array = [we.weathers componentsSeparatedByString:@","];
        self.futuerImage.image = [UIImage imageNamed:[we weatherForImage:array[0]]];
        self.futuerImage1.image = [UIImage imageNamed:[we weatherForImage:array[1]]];
        self.futuerImage2.image = [UIImage imageNamed:[we weatherForImage:array[2]]];
        self.futuerImage3.image = [UIImage imageNamed:[we weatherForImage:array[3]]];
        self.futuerimage4.image = [UIImage imageNamed:[we weatherForImage:array[4]]];
        [sub getString:we.quxianTenper];
    }

}
- (IBAction)actionSheetButton:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享天气" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *qqAction = [UIAlertAction actionWithTitle:@"分享到qq空间" style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action){
    }];
    UIAlertAction *weixinAction = [UIAlertAction actionWithTitle:@"分享到微信朋友圈" style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action){
    }];
    UIAlertAction *weiboAction = [UIAlertAction actionWithTitle:@"分享到微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
    }];
    [alertController addAction:qqAction];
     [alertController addAction:weiboAction];
     [alertController addAction:weixinAction];
     [alertController addAction:noAction];
    [self presentViewController:alertController animated:YES completion:nil];

    
}
@end
