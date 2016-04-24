//
//  CustomCell.m
//  cellChangeHeight
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"

@interface CustomCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpSubView];
    }
    return self;
}


- (void)setUpSubView{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
    
    UIButton *btn = [[UIButton alloc] init];

    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    self.btn = btn;
    
    [self.contentView addSubview:btn];
    
    
    self.titleLabel = titleLabel;
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.right.bottom.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@20);
    }];
    
}


- (void)setModel:(CellModel *)model{
    
    _model = model;
    self.titleLabel.text = model.title;
    if (model.isShow) {
        [self zhankai];
        
        [self.btn setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        
        [self shouqi];
        [self.btn setTitle:@"展开" forState:UIControlStateNormal];
    }
//    model.isShow = !model.isShow;
}

- (void)zhankai{
    
    
    

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.btn.mas_top);
    }];
    
    

    
}


- (void)shouqi{
    
    
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@44);
    }];


}

@end
