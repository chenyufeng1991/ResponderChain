//
//  ThirdViewController.m
//  ResponderDemo
//
//  Created by chenyufeng on 16/5/10.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UIButton *judgeThisButton;

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.tag = 100;
    self.nameTextField.tag = 101;
    self.passwordTextField.tag = 102;
}

// 找到当前页面中谁是第一响应者
- (IBAction)whoIsFirstResponder:(id)sender
{
    if ([self.view isFirstResponder])
    {
        [self showDialog:nil message:[NSString stringWithFormat:@"第一响应者是%ld",(long)self.view.tag]];
        return;
    }

    for (UIView *view in self.view.subviews)
    {
        if ([view isFirstResponder])
        {
            [self showDialog:nil message:[NSString stringWithFormat:@"第一响应者是%ld",(long)view.tag]];
            return;
        }
    }
}

// 设置nameTextField 101为第一响应者
- (IBAction)setNameToFirstResponder:(id)sender
{
    if (![self.nameTextField isFirstResponder])
    {
        if ([self.nameTextField canBecomeFirstResponder])
        {
            [self.nameTextField becomeFirstResponder];
            [self showDialog:nil message:@"设置101为第一响应者"];
        }
    }
}

//取消nameTextField 101为第一响应者
- (IBAction)cancelNameFromFirstResponder:(id)sender
{
    if ([self.nameTextField isFirstResponder])
    {
        [self.nameTextField resignFirstResponder];
        [self showDialog:nil message:@"取消101为第一响应者"];
    }
}

//设置self.view为第一响应者
- (IBAction)setSelfViewToFirstResponder:(id)sender
{
    if ([self.view canBecomeFirstResponder])
    {
        [self.view becomeFirstResponder];
        if ([self.view isFirstResponder])
        {
            [self showDialog:nil message:@"设置self.view为第一响应者成功"];
        }
        else
        {
            [self showDialog:nil message:@"设置self.view为第一响应者失败"];
        }
    }
    else
    {
        [self showDialog:nil message:@"不能设置self.view第一响应者"];
    }
}

//判断按钮能否成为第一响应
- (IBAction)buttonCanBecomeFirstResponder:(id)sender
{
    if ([self.judgeThisButton canBecomeFirstResponder])
    {
        [self.judgeThisButton becomeFirstResponder];
        if ([self.judgeThisButton isFirstResponder ])
        {
            [self showDialog:nil message:@"设置该按钮为第一响应者成功"];
        }
        else
        {
            [self showDialog:nil message:@"设置该按钮为第一响应者失败"];
        }
    }
    else
    {
        [self showDialog:nil message:@"不能设置该按钮为第一响应者"];
    }
}


- (IBAction)getNextResponder:(id)sender
{
    UIResponder *responder = [self.nameTextField nextResponder];

    while (responder != nil) {
        responder = [responder nextResponder];
    }


}



- (void)showDialog:(NSString *)title message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title  message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
