//
//  LPGoWhereViewController.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/27.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "LPGoWhereViewController.h"
#import "HSDataModel.h"
#import "HSData.h"
#import "ConvertNull.h"
#import "ShakeAnimation.h"
@interface LPGoWhereViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *showPhoneTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation LPGoWhereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机归属地查询";
    self.phoneLabel.text = @"请输入手机号码";
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
//    NSNumber *number = [NSNumber ,self.phoneTextField.text];
    
}

- (IBAction)clickButton:(UIButton *)sender {
    [self.phoneTextField resignFirstResponder];
    if (self.phoneTextField.text.length == 0) {
        [ShakeAnimation lockAnimationForView:self.phoneTextField];
    }else {
        [HSDataModel phoneNumberWhere:self.phoneTextField.text  block:^(NSMutableArray *phoneArray) {
            HSData *data = [phoneArray objectAtIndex:0];
            
            self.showPhoneTextLabel.text = [NSString stringWithFormat:@"手机归属地:%@,省份:%@-城市:%@,卡类型:%@", data.supplier,data.province,data.city,data.suit];
        }];
    }
    
}


@end
