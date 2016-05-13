//
//  AppDelegate.m
//  ResponderDemo
//
//  Created by chenyufeng on 16/5/10.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.tabController = [[UITabBarController alloc] init];

    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.title = @"第一";
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.title = @"第二";

    UINavigationController *firstNavi = [[UINavigationController alloc] initWithRootViewController:firstVC];
    UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:secondVC];

    self.tabController.viewControllers = @[firstNavi,secondNavi];
    self.window.rootViewController = self.tabController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

//这里的优先级最低
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
     NSLog(@"%s",__FUNCTION__);
}

@end
