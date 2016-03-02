//
//  ViewController.m
//  MyHoverTableViewDemo
//
//  Created by konka on 16/3/1.
//  Copyright © 2016年 My. All rights reserved.
//

#import "ViewController.h"
#import "HoverTableView.h"

#define PHONE_WIDTH [UIScreen mainScreen].bounds.size.width
#define PHONE_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    HoverTableView *mHoverTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mHoverTableView = [[HoverTableView alloc]init];
    mHoverTableView.frame = CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT);
    mHoverTableView.delegate = self;
    mHoverTableView.dataSource = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 80)];
    view.backgroundColor = [UIColor blackColor];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 300)];
    headView.backgroundColor = [UIColor redColor];
    
    mHoverTableView.tableHeaderView = headView;
    mHoverTableView.hoverView = view;
    mHoverTableView.hoverMaxHeight = 220;
    [self.view addSubview:mHoverTableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1000;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%d个",(int)indexPath.row];
    return cell;
}
- (IBAction)reload:(UIButton *)sender {
    [mHoverTableView reloadData];
}

@end
