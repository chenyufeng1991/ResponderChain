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

- (IBAction)whoIsFirstResponder:(id)sender
{
    NSLog(@"%@",self.view.subviews);
    for (UIView *view in self.view.subviews)
    {
        if ([view isFirstResponder])
        {
            NSLog(@"该界面第一响应者是：%ld",(long)view.tag);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"第一响应者是：%ld",(long)view.tag] preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            break;
        }
    }
}



@end
