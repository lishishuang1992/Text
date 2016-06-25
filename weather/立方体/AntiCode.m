//
//  AntiCode.m
//  立方体
//
//  Created by 李世爽 on 16/1/18.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "AntiCode.h"

@implementation AntiCode


-(void)code :(CLLocation *)location{
    NSString *longitude = [[NSString alloc] initWithFormat:@"%f",location.coordinate.longitude];
    NSString *latitude = [[NSString alloc]initWithFormat:@"%f", location.coordinate.latitude];
    NSString *strURL = [[NSString alloc]initWithFormat:@"http://v.juhe.cn/weather/geo?format=2&key=015ad115acb48bbc2dc36b766f66a576&lon=%@&lat=%@",longitude,latitude];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSError *er;
    NSLog(@"request:%@",request);
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&er];
    [self analysis:data];
}

//根据城市名从接口处获得信息
-(void)city:(NSString *)c{
    NSString *strURL = [[NSString alloc]initWithFormat:@"http://v.juhe.cn/weather/index?format=1&cityname=%@&key=fecbbcdffa523fdabc93809c363c95de",c];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSError *er;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&er];
    [self analysis:data];
    
}


//返回城市，日期，星期，风，温度

//从文件获取数据
-(void)analysis:(NSData *)data{
    
     NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *result = [resDict objectForKey:@"result"];
        self.future = [result objectForKey:@"future"];
        self.today = [result objectForKey:@"today"];
        self.sk = [result objectForKey:@"sk"];
    
}




-(NSString *)todayhealth{
    NSString *city = [self.today objectForKey:@"city"];
    NSString *date = [self.today objectForKey:@"date_y"];
    NSString *week = [self.today objectForKey:@"week"];
    NSString *wind = [self.today objectForKey:@"wind"];
    NSString *weather = [self.today objectForKey:@"weather"];
    NSString *temperature = [self.today objectForKey:@"temperature"];
    //[self weatherForImage:weather];
    NSString *string = [[NSString alloc] initWithFormat:@"城市：%@\n日期：%@\n天气：%@\n  %@\n温度：%@\n风向：%@",city,date,weather,week,temperature,wind];
    self.todayWeatherImage = weather;
    return string;
    
    
}

-(NSMutableString *)getQuxian{
    return self.quxianTenper;
}

-(NSMutableString *)getWeekString{
    return self.weeks;
}

-(NSString *)futurehealth{
    NSMutableString *string = [[NSMutableString alloc] init];
    self.quxianTenper = [[NSMutableString alloc] init];
    self.weathers = [[NSMutableString alloc] init];
    self.weeks = [[NSMutableString alloc] init];
    for (int i = 1; i <=5 ; i++) {
        NSString *week = [self.future[i] objectForKey:@"week"];
        NSString *temperature = [self.future[i] objectForKey:@"temperature"];
        NSString *weather = [self.future[i] objectForKey:@"weather"];
        [string appendFormat:@"%@    %@    %@\n\n\n",week,temperature,weather];
        [self.quxianTenper appendFormat:@"%@,",temperature];
        [self.weathers appendFormat:@"%@,",weather];
        [self.weeks appendFormat:@"%@,",week];

    }
    NSLog(@"nininini%@ ",self.weeks);
    return string;
}
//根据天气，选择天气图标名字
-(NSString *)weatherForImage:(NSString *)weath{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"晴",@"1",@"多云",@"2",@"阴",@"3",@"阵雨",@"4",@"雷阵雨",@"5",@"雷阵雨并伴有冰雹",@"6",@"雨加雪",@"7",@"小雨",@"8",@"中雨",@"9",@"晴",@"10",@"暴雨",@"11",@"大暴雨",@"12",@"特大暴雨",@"13",@"阵雪",@"14",@"小雪",@"15",@"中雪",@"16",@"大雪",@"17",@"暴雪",@"18",@"雾",@"19",@"冻雨",@"20",@"沙尘暴",@"21",@"小雨转中雨",@"22",@"中雨转大雨",@"23",@"大雨转暴雨",@"24",@"暴雨转大暴雨",@"25",@"大暴雨转特大暴雨",@"26",@"小雪转中雪",@"27",@"中雪转大雪",@"28",@"大雪转暴雪",@"29",@"浮尘",@"30",@"扬沙",@"31",@"强沙尘暴",@"nothing",@"没有数据", nil];
    NSString *string = [dict objectForKey:weath];
    if (string == nil) {
        return @"nothing";
    }
    return string;
}

//-(NSString )
#pragma mark- NSURLConnection 回调方法
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    [self.datas appendData:data];
//}
//
//
-(void) connection:(NSURLConnection *)connection didFailWithError: (NSError *)error {



}
//
//- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
//    NSLog(@"请求完成...");
//    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:self.datas options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",dict);
//    //[self reloadView:dict];
//}
//
@end
