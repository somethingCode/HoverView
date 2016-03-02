//
//  HoverTableView.h
//  HoverTableView
//
//  Created by konka on 16/3/1.
//  Copyright © 2016年 My. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DEFAULT_HOVER_MAXHEIGHT 200

@interface HoverTableView : UITableView

@property(nonatomic,strong)UIView *hoverView;
@property(nonatomic,assign)CGFloat hoverMaxHeight;

@end