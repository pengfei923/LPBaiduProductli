//
//  HSData.h
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/25.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSData : NSObject
/**
 "phone": 手机号码,
 "prefix": 手机号码前7位,
 "supplier": "移动 ",
 "province": 省份,
 "city": 城市,
 "suit": "152卡"
 */
@property (nonatomic,copy)NSArray *retData;
@property (nonatomic,copy)NSString *phone;
@property (nonatomic,copy)NSString *prefix;
@property (nonatomic,copy)NSString *supplier;
@property (nonatomic,copy)NSString *province;
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *suit;

@property (nonatomic,copy)NSString *endTime;
@property (nonatomic,copy)NSString *startTime;
@property (nonatomic,copy)NSString *from;
@property (nonatomic,copy)NSString *to;
@property (nonatomic,copy)NSString *trainType;
@property (nonatomic,copy)NSString *trainNo;
@property (nonatomic,copy)NSString *duration;

@property (nonatomic,copy)NSArray *seatInfos;
@property (nonatomic,copy)NSString *remainNum;
@property (nonatomic,copy)NSString *seat;
@property (nonatomic,copy)NSString *seatPrice;
@end
