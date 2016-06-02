//
//  LPMainViewController.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/27.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "LPMainViewController.h"
#import "LPGoWhereViewController.h"
#import "LPGoWhereStatusViewController.h"
#import "BaiduMobAdView.h"
@interface LPMainViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,BaiduMobAdViewDelegate> {
    BaiduMobAdView *sharedAdView;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation LPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的小应用";
    [self settabelView];
    [self setScrollView];
    
    
}

-(void)setScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80)];
    self.scrollView = scrollView;
    sharedAdView = [[BaiduMobAdView alloc] init];
    sharedAdView.AdUnitTag = @"c023fb9d"; sharedAdView.AdType = BaiduMobAdViewTypeBanner; sharedAdView.frame = scrollView.frame;
    sharedAdView.delegate = self;
    [self.view addSubview:sharedAdView];
    [sharedAdView start];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    self.tableView.tableHeaderView = scrollView;
}

- (NSString *)publisherId {
    return @"ccb60059"; //@"your_own_app_id";
}

-(void) willDisplayAd:(BaiduMobAdView*) adview {
    NSLog(@"delegate: will display ad");
}

-(BOOL) enableLocation {
    //启用location会有一次alert提示,请根据系统进行相关配置
    return NO;
}

-(void)settabelView {
    UITableView *tableView= [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"号码百事通";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = @"火车票查询";
    }else {
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LPGoWhereViewController *goWhere = [[LPGoWhereViewController alloc]init];
        [self.navigationController pushViewController:goWhere animated:YES];
    }else if (indexPath.row == 1) {
        LPGoWhereStatusViewController *status = [[LPGoWhereStatusViewController alloc]init];
        [self.navigationController pushViewController:status animated:YES];
    }else {
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

@end
