//
//  LPGoWhereStatusViewController.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/27.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "LPGoWhereStatusViewController.h"
#import "HSData.h"
#import "HSDataModel.h"
#import "LPGoWhereViewCell.h"
#import "HSGoWhereStatusView.h"
#import "ShakeAnimation.h"
@interface LPGoWhereStatusViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *goWhereDataArray;
@property (nonatomic,strong)HSGoWhereStatusView *goWhereView;
@property (nonatomic,strong)NSString *dateTime;
@end

@implementation LPGoWhereStatusViewController
@synthesize goWhereDataArray = _goWhereDataArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"火车票查询";
    
    [self setTabelView];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    self.dateTime = dateTime;
    NSLog(@"时间%@",self.dateTime);
    
    HSGoWhereStatusView *goWhereView = [[HSGoWhereStatusView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 140)];
    self.goWhereView = goWhereView;
    [self.goWhereView.sureButton addTarget:self action:@selector(clickSureButton:) forControlEvents:UIControlEventTouchUpInside];
    self.goWhereView.fromTextField.text = @"西安北";
    self.goWhereView.toTextField.text = @"大荔";
    self.goWhereView.dateTextField.text = self.dateTime;
    NSLog(@"%@",self.goWhereView.dateTextField.text);
    self.tableView.tableHeaderView = goWhereView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickRemoveView:)];
    [self.tableView addGestureRecognizer:tap];
    
}

-(void)clickRemoveView:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];
}

-(void)clickSureButton:(UIButton *)sender {
    if (self.goWhereView.fromTextField.text.length == 0 && self.goWhereView.toTextField.text.length == 0 && self.goWhereView.dateTextField.text.length == 0) {
        [ShakeAnimation lockAnimationForView:self.goWhereView.fromTextField];
        [ShakeAnimation lockAnimationForView:self.goWhereView.toTextField];
        [ShakeAnimation lockAnimationForView:self.goWhereView.dateTextField];
        
    }else {
        [HSDataModel getGoWhereDataVersion:@"1.0" andFrom:self.goWhereView.fromTextField.text andTo:self.goWhereView.toTextField.text andDate:self.goWhereView.dateTextField.text block:^(NSMutableArray *goWhereArray) {
            self.goWhereDataArray = goWhereArray;
            [self.tableView reloadData];
        }];
    }
    
}

-(void)setTabelView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPGoWhereViewCell" bundle:nil] forCellReuseIdentifier:@"celled"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _goWhereDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"celled";
    LPGoWhereViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[LPGoWhereViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    HSData *data = [_goWhereDataArray objectAtIndex:indexPath.row];
    cell.startTime.text = [NSString stringWithFormat:@"%@%@",data.trainType,data.trainNo];
    cell.endTime.text = [NSString stringWithFormat:@"时间：%@-%@",data.startTime,data.endTime];
    cell.from.text = [NSString stringWithFormat:@"%@-%@",data.from,data.to];
    cell.to.text = [NSString stringWithFormat:@"运行时间:%@",data.duration];
    cell.trainNo.text = [NSString stringWithFormat:@"类型:%@价格:%@",data.seat,data.seatPrice];
    cell.trainType.text = [NSString stringWithFormat:@"剩余的票数:%@",data.remainNum];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


@end
