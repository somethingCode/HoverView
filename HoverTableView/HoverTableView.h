//
//  HoverTableView.h
//  HoverTableView
//
//  Created by konka on 16/3/1.
//  Copyright © 2016年 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DEFAULT_HOVER_START_OFFSETY 200
#define DEFAULT_HOVER_TOP_OFFSETY 0

@interface HoverTableView : UITableView

@property(nonatomic,strong)UIView *hoverView;
@property(nonatomic,strong)UIView *tableheadViewBackView;
@property(nonatomic,assign)CGFloat hoverStartOffsetY;
@property(nonatomic,assign)CGFloat hoverTopOffsetY;

-(void)beginHoverState;

@end
