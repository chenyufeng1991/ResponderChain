//
//  FirstViewController.m
//  ResponderDemo
//
//  Created by chenyufeng on 16/5/10.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *myArray;
@property (strong, nonatomic) UITableView *myTableView;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.myArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2", nil];
    self.myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;

    [self.view addSubview:self.myTableView];



}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.myArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0)
    {
        ThirdViewController *third = [[ThirdViewController alloc] init];
        third.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:third animated:YES];
    }
    if (indexPath.row == 1)
    {
        FourthViewController *fourth = [[FourthViewController alloc] init];
        [self presentViewController:fourth animated:YES completion:nil];
    }

}



@end
