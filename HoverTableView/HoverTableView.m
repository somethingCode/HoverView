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
    NSLog(@"didMoveToSuperview");
    [self beginHoverState];
}

-(void)beginHoverState{
    if(!_hoverView)
        return;
    if(_hoverMaxHeight <= 0)
        _hoverMaxHeight = DEFAULT_HOVER_MAXHEIGHT;
    if(_hoverMinHeight <= 0)
        _hoverMinHeight = DEFAULT_HOVER_MINHEIGHT;
    
    _hoverView.frame = CGRectMake(_hoverView.frame.origin.x, _hoverMaxHeight, _hoverView.frame.size.width, _hoverView.frame.size.height);
    if(_tableheadViewBackView){
        _tableheadViewBackView.frame = CGRectMake(_hoverView.frame.origin.x, _hoverMinHeight, _hoverView.frame.size.width, _hoverMaxHeight - _hoverMinHeight);
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
            if(self.contentOffset.y > _hoverMaxHeight - _hoverMinHeight)
                hoverHeight = _hoverMinHeight;
            else
                hoverHeight = _hoverMaxHeight - self.contentOffset.y;
            CGRect rect = CGRectMake(_hoverView.frame.origin.x, hoverHeight, _hoverView.frame.size.width, _hoverView.frame.size.height);
            _hoverView.frame = rect;
            if(_tableheadViewBackView)
                _tableheadViewBackView.frame = CGRectMake(rect.origin.x, _hoverMinHeight, rect.size.width, rect.origin.y - _hoverMinHeight);
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

@end
