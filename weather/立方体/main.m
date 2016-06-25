//
//  main.m
//  立方体
//
//  Created by 李世爽 on 16/1/18.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>
int main(int argc, char * argv[]) {
    @autoreleasepool {
        [Bmob registerWithAppKey:@"2c4a67a9c78a16b7b3442c894262f9f8"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
