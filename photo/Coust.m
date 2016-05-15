//
//  Coust.m
//  周末作业
//
//  Created by mac on 16/3/5.
//  Copyright (c) 2016年 lzc. All rights reserved.
//

#import "Coust.h"

@implementation Coust

{
    UIImageView *_imageV;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-30, self.frame.size.height-30, 30, 30)];
        _imageV.image = [UIImage imageNamed:@"1"];
        //默认不选中
        _imageV.hidden = YES;
        
        [self addSubview:_imageV];
    }
    return self;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (self.isSelected) {
        _imageV.hidden = NO;
    }else{
        _imageV.hidden = YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
