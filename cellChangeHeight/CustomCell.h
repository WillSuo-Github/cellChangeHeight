//
//  CustomCell.h
//  cellChangeHeight
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"

@interface CustomCell : UITableViewCell

@property (nonatomic, strong) CellModel *model;

@property (nonatomic, strong) UIButton *btn;




- (void)shouqi;
- (void)zhankai;

@end
