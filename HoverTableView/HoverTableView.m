//
//  HoverTableView.m
//  HoverTableView
//
//  Created by konka on 16/3/1.
//  Copyright © 2016年 My. All rights reserved.
//

#import "HoverTableView.h"

@implementation HoverTableView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)didMoveToSuperview{
    if(!_hoverView)
        return;
    if(_hoverMaxHeight <= 0)
        _hoverMaxHeight = DEFAULT_HOVER_MAXHEIGHT;
    CGRect rect = CGRectMake(_hoverView.frame.origin.x, _hoverMaxHeight, _hoverView.frame.size.width, _hoverView.frame.size.height);
    _hoverView.frame = rect;
    [self.superview addSubview:_hoverView];
    [self.superview bringSubviewToFront:_hoverView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]){
        if(_hoverView){
            CGFloat hoverHeight;
            if(self.contentOffset.y > _hoverMaxHeight)
                hoverHeight = 0;
            else
                hoverHeight = _hoverMaxHeight - self.contentOffset.y;
            CGRect rect = CGRectMake(_hoverView.frame.origin.x, hoverHeight, _hoverView.frame.size.width, _hoverView.frame.size.height);
            _hoverView.frame = rect;
        }
    }
}

@end
