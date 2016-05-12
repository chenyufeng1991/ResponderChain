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

- (IBAction)getNextResponder:(id)sender
{
    UIResponder *responder = sender;
    NSLog(@"\n%@\n",responder);
    while (responder != nil)
    {
        responder = [responder nextResponder];
        NSLog(@"\n%@\n",responder);
    }
}


@end
