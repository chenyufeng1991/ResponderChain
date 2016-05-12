//
//  ThirdViewController.m
//  ResponderDemo
//
//  Created by chenyufeng on 16/5/10.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self.nameTextField addTarget:self action:@selector(nameTextFieldBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self.nameTextField addTarget:self action:@selector(nameTextFieldEnd) forControlEvents:UIControlEventEditingDidEnd];

    self.nameTextField.tag = 101;
    self.passwordTextField.tag = 102;
    [self.nameTextField becomeFirstResponder];

}

- (void)nameTextFieldBegin
{
    if ([self.nameTextField isFirstResponder])
    {
        NSLog(@"%s,nameTextField是第一响应",__FUNCTION__);
    }
    else
    {
        NSLog(@"%s,nameTextField不是第一响应",__FUNCTION__);
    }

    NSLog(@"nameTextFieldBegin");
}

- (void)nameTextFieldEnd
{

    if ([self.nameTextField isFirstResponder])
    {
        NSLog(@"%s,nameTextField是第一响应",__FUNCTION__);
    }
    else
    {
        NSLog(@"%s,nameTextField不是第一响应",__FUNCTION__);
    }

    NSLog(@"nameTextFieldEnd");
}

// 找到当前页面中谁是第一响应者
- (IBAction)whoIsFirstResponder:(id)sender
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isFirstResponder])
        {
            NSLog(@"该界面第一响应者是：%ld",(long)view.tag);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"第一响应者是：%ld",(long)view.tag] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            break;
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
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"成功设置101为第一响应者" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}


@end
