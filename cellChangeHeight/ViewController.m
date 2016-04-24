//
//  ViewController.m
//  cellChangeHeight
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "Masonry.h"
#import "CellModel.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<CellModel *> *sourceArr;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 44.0; // 设置为一个接近“平均”行高的值
    self.tableView = tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sourceArr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.sourceArr[indexPath.row];
    cell.btn.tag = indexPath.row;
    
    [cell.btn addTarget:self action:@selector(cellBtnChick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

- (void)cellBtnChick:(UIButton *)btn{
    
//    NSLog(@"%ld",btn.tag);
    NSLog(@"%d",self.sourceArr[1].isShow);
    CellModel *model = self.sourceArr[btn.tag];
    model.isShow = !model.isShow;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
}


- (NSArray *)sourceArr{
    
    if (_sourceArr == nil) {
        NSString *str1 = @"凤凰网IE胡佛京东覅搜地方就强迫我我感觉饿哦ID精神高尚的个法搜地方骄傲ID就是放屁";
        CellModel *model1 = [[CellModel alloc] init];
        model1.title = str1;
        model1.isShow = NO;
        
        NSString *str2 = @"我奇偶发技术的佛家搜地发哦是滴够我氨基酸都挂机爱破碎的国家圣诞节股票上的价格牌是打破地就安排送到家挂牌就是店铺公安局都是破格吉安帕冬季奥迪价格AOI";
        CellModel *model2 = [[CellModel alloc] init];
        model2.title = str2;
        model2.isShow = NO;
        
        NSString *str3 = @"奥斯丁金佛爱就是地方安山东发件破损第赶紧跑is的价格破爱就是的苹果哦年的搜狗及安排送挂牌苏东坡管家婆四大金刚奥迪斯高家坡上的国家抛尸的管家婆爱打击食品工啊接生婆地锅鸡阿婆四大金刚破阿迪是股票的价格牌九三等功你家啊懂规矩啊破损的感觉";
        CellModel *model3 = [[CellModel alloc] init];
        model3.title = str3;
        model3.isShow = NO;
        
        _sourceArr = @[model1,model2,model3,model2,model3,model2,model2,model3,model2,model3,model3,model1];
    }
    return _sourceArr;
}

@end
