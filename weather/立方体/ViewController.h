//
//  ViewController.h
//  立方体
//
//  Created by 李世爽 on 16/1/18.
//  Copyright © 2016年 李世爽. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AntiCode.h"
#import "subView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *magentaView;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
- (IBAction)bn0:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *grayView;
- (IBAction)bn1:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (weak, nonatomic) IBOutlet UIView *lastView;
- (IBAction)bn2:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
- (IBAction)bn3:(id)sender;

//显示

- (IBAction)actionSheetButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageToday;
@property (weak, nonatomic) IBOutlet UITextView *textViewFuture;
@property (weak, nonatomic) IBOutlet UIImageView *futuerImage;
@property (weak, nonatomic) IBOutlet UIImageView *futuerImage1;
@property (weak, nonatomic) IBOutlet UIImageView *futuerImage2;
@property (weak, nonatomic) IBOutlet UIImageView *futuerImage3;
@property (weak, nonatomic) IBOutlet UIImageView *futuerimage4;

@property (weak, nonatomic) IBOutlet UITextField *textFiled;
- (IBAction)cityButton:(id)sender;
@property (weak, nonatomic) IBOutlet subView *subView1;


//保存全部信息
@property (nonatomic ,strong) NSDictionary *pickerData;
@property (nonatomic , strong) NSArray *pickerProvincesData;
@property (nonatomic , strong) NSArray *pickerCitiesData;


@property(nonatomic, strong) CLLocationManager *locationManager;
@end

