//
//  FourthViewController.m
//  ResponderDemo
//
//  Created by chenyufeng on 16/5/12.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nextResponderButton;


@end

@implementation FourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nextResponderButton.tag = 101;
    self.view.tag = 102;
    

}

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//获得整个触摸事件的响应链
- (IBAction)getNextResponder:(id)sender
{
    UIResponder *responder = sender;
    NSLog(@"\n%@\n",[responder class]);
    while (responder != nil)
    {
        responder = [responder nextResponder];
        NSLog(@"\n%@\n",[responder class]);
    }
}

/**
 * 在按钮点击后，在消息传递中当传到该VC对象以及UIApplication时，捕获该事件。
 一条链上的对象可以对同一事件作出反应。
 */
- (IBAction)captureEvent:(id)sender
{
    UIResponder *responder = sender;
    while (responder != nil)
    {
        if ([responder isKindOfClass:[self class]])  
        {
            NSLog(@"事件传递到该类VC,可以执行相应操作");
        }

        if ([responder isKindOfClass:[UIApplication class]])
        {
            NSLog(@"事件传递到UIApplication,可以执行相应操作");
        }
        responder = [responder nextResponder];
    }
}

/**
 *  这里先捕获触摸，停止事件分发，所以AppDelegate中重写的touchesBegan不会有反应。除非这里使用super.
 *
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__FUNCTION__);
}



@end
