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

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)didMoveToSuperview{
//    [self beginHoverState];
}

-(void)beginHoverState{
    if(!_hoverView)
        return;
    if(_hoverStartOffsetY <= 0)
        _hoverStartOffsetY = DEFAULT_HOVER_START_OFFSETY;
    if(_hoverTopOffsetY <= 0)
        _hoverTopOffsetY = DEFAULT_HOVER_TOP_OFFSETY;
    
    _hoverView.frame = CGRectMake(_hoverView.frame.origin.x, _hoverStartOffsetY, _hoverView.frame.size.width, _hoverView.frame.size.height);
    if(_tableheadViewBackView){
        _tableheadViewBackView.frame = CGRectMake(_hoverView.frame.origin.x, _hoverTopOffsetY, _hoverView.frame.size.width, _hoverStartOffsetY - _hoverTopOffsetY);
        [self.superview addSubview:_tableheadViewBackView];
        [self.superview sendSubviewToBack:_tableheadViewBackView];
        self.backgroundColor = [UIColor clearColor];
    }
    [self.superview addSubview:_hoverView];
    [self.superview bringSubviewToFront:_hoverView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]){
        if(_hoverView){
            CGFloat hoverHeight;
            if(self.contentOffset.y > _hoverStartOffsetY - _hoverTopOffsetY)
                hoverHeight = _hoverTopOffsetY;
            else
                hoverHeight = _hoverStartOffsetY - self.contentOffset.y;
            CGRect rect = CGRectMake(_hoverView.frame.origin.x, hoverHeight, _hoverView.frame.size.width, _hoverView.frame.size.height);
            _hoverView.frame = rect;
            if(_tableheadViewBackView)
                _tableheadViewBackView.frame = CGRectMake(rect.origin.x, _hoverTopOffsetY, rect.size.width, rect.origin.y - _hoverTopOffsetY);
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

@end
