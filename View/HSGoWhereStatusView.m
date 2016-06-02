//
//  HSGoWhereStatusView.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/30.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "HSGoWhereStatusView.h"

@implementation HSGoWhereStatusView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITextField *fromTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 10, frame.size.width/2 - 60, 30)];
        self.fromTextField = fromTextField;
        fromTextField.backgroundColor = [UIColor grayColor];
        fromTextField.textAlignment = YES;
        [self addSubview:fromTextField];
        UIButton *selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(fromTextField.frame.origin.x + fromTextField.frame.size.width + 10, 10, 60, 30)];
        self.selectBtn = selectBtn;
        [selectBtn setTitle:@"至" forState:UIControlStateNormal];
        selectBtn.backgroundColor = [UIColor greenColor];
        [self addSubview:selectBtn];
        UITextField *toTextField = [[UITextField alloc]initWithFrame:CGRectMake(selectBtn.frame.origin.x + selectBtn.frame.size.width + 10, 10, frame.size.width/2 - 60, 30)];
        self.toTextField = toTextField;
        toTextField.textAlignment = YES;
        toTextField.backgroundColor = [UIColor grayColor];
        [self addSubview:toTextField];
        UITextField *dateTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, fromTextField.frame.origin.y + fromTextField.frame.size.height + 10, frame.size.width - 40, 30)];
        self.dateTextField = dateTextField;
        dateTextField.backgroundColor = [UIColor grayColor];
        
        [self addSubview:dateTextField];
        UIButton *sureButton = [[UIButton alloc]initWithFrame:CGRectMake(20, dateTextField.frame.origin.y + dateTextField.frame.size.height + 10, frame.size.width - 40, 30)];
        self.sureButton = sureButton;
        [sureButton setTitle:@"点击查询" forState:UIControlStateNormal];
        sureButton.backgroundColor = [UIColor redColor];
        [self addSubview:sureButton];
    }
    return self;
}

@end
