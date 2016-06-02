//
//  LPGoWhereViewCell.h
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/27.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPGoWhereViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UILabel *to;
@property (weak, nonatomic) IBOutlet UILabel *trainNo;
@property (weak, nonatomic) IBOutlet UILabel *trainType;


@end
