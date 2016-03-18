# HoverView
the hover view

USAGE


    #import "HoverTableView.h"

    mHoverTableView = [[HoverTableView alloc]init];
    mHoverTableView.frame = CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT);
    mHoverTableView.delegate = self;
    mHoverTableView.dataSource = self;
    
    mHoverTableView.tableHeaderView = headView;
    mHoverTableView.hoverView = view;
    mHoverTableView.tableheadViewBackView = imageView;
    mHoverTableView.hoverStartOffsetY = 220;
    mHoverTableView.hoverTopOffsetY = 20;
    [self.view addSubview:mHoverTableView];
    [mHoverTableView beginHoverState];
