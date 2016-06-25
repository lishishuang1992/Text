//
//  AntiCode.h
//  立方体
//
//  Created by 李世爽 on 16/1/18.
//  Copyright © 2016年 李世爽. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <CoreLocation/CoreLocation.h>
@interface AntiCode : NSObject <CLLocationManagerDelegate>

@property (nonatomic ,strong) NSArray *future;

@property (nonatomic ,strong) NSDictionary *today;

@property (nonatomic ,strong) NSDictionary *sk;

@property (nonatomic ,strong) NSMutableString *weathers;


@property (nonatomic ,strong) NSMutableString *quxianTenper;

@property (nonatomic ,strong)NSString *todayWeatherImage;


@property(nonatomic , strong)NSMutableString *weeks;

-(NSString *)todayhealth;
-(void)code :(CLLocation *)location;
-(void)city:(NSString *)c;
-(NSString *)weather;
-(NSString *)futurehealth;
-(NSString *)weatherForImage:(NSString *)weath;
-(NSMutableString *)getWeekString;
-(NSMutableString *)getQuxian;

@end
