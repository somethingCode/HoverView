//
//  ViewController.m
//  MyHoverTableViewDemo
//
//  Created by konka on 16/3/1.
//  Copyright © 2016年 My. All rights reserved.
//

#import "ViewController.h"
#import "HoverTableView.h"
#import "TableViewCellOne.h"
#import "TableViewCellTwo.h"

#define PHONE_WIDTH [UIScreen mainScreen].bounds.size.width
#define PHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define CELL_ONE 0
#define CELL_TWO 1

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    HoverTableView *mHoverTableView;
    NSArray *dataOne;
    NSArray *dataTwo;
    NSArray *data;
    NSUInteger select;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initData{
    dataOne = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",nil];
    
    dataTwo = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",nil];
    
    data = dataOne;
    
    select = CELL_ONE;
}

- (void)initView {
    mHoverTableView = [[HoverTableView alloc]init];
    mHoverTableView.frame = CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT);
    mHoverTableView.delegate = self;
    mHoverTableView.dataSource = self;
    
    [mHoverTableView registerNib:[UINib nibWithNibName:@"TableViewCellOne" bundle:nil] forCellReuseIdentifier:@"TableViewCellOne"];
    [mHoverTableView registerNib:[UINib nibWithNibName:@"TableViewCellTwo" bundle:nil] forCellReuseIdentifier:@"TableViewCellTwo"];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 80)];
    view.backgroundColor = [UIColor lightGrayColor];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 300)];
    headView.backgroundColor = [UIColor redColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button1.backgroundColor = [UIColor yellowColor];
    [button1 setTitle:@"changeToTypeOne" forState:UIControlStateNormal];
    button1.frame = CGRectMake(0, 0, PHONE_WIDTH/2, 80);
    [button1 addTarget:self action:@selector(changeToDataOne) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"changeToTypeOne" forState:UIControlStateNormal];
    button2.frame = CGRectMake(PHONE_WIDTH/2, 0, PHONE_WIDTH/2, 80);
    [button2 addTarget:self action:@selector(changeToDataTwo) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button2];
    
    mHoverTableView.tableHeaderView = headView;
    mHoverTableView.hoverView = view;
    mHoverTableView.hoverMaxHeight = 220;
    mHoverTableView.hoverMinHeight = 20;
    [self.view addSubview:mHoverTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (select) {
        case CELL_ONE:
            return 50;
            break;
        case CELL_TWO:
            return 45;
            break;
        default:
            break;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (select) {
        case CELL_ONE:
             cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellOne" forIndexPath:indexPath];
            ((TableViewCellOne*)cell).tipsLabel.text = [NSString stringWithFormat:@"第%@个",(NSString*)[data objectAtIndex:indexPath.row]];
            break;
        case CELL_TWO:
            cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellTwo" forIndexPath:indexPath];
            ((TableViewCellTwo*)cell).tipsLabel.text = [NSString stringWithFormat:@"第%@个",(NSString*)[data objectAtIndex:indexPath.row]];
            break;
        default:
            break;
    }
    return cell;
}

-(void)changeToDataOne{
    select = CELL_ONE;
    data = dataOne;
    [mHoverTableView reloadData];
}

-(void)changeToDataTwo{
    select = CELL_TWO;
    data = dataTwo;
    [mHoverTableView reloadData];
}


@end
