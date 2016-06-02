//
//  HSDataModel.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/25.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "HSDataModel.h"
#import <AFNetworking/AFNetworking.h>

#import "HSData.h"
@implementation HSDataModel

+(void)getGoWhereDataVersion:(NSString *)version andFrom:(NSString *)from andTo:(NSString *)to andDate:(NSString *)date block:(void(^)(NSMutableArray *goWhereArray))block; {
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage.requestSerializer setValue:@"149e950fc4bfd3b501c60fa0f0d0a85a" forHTTPHeaderField:@"apikey"];
    NSString *urlStr = @"http://apis.baidu.com/qunar/qunar_train_service/s2ssearch";
    NSDictionary *parameters = @{@"version":version,@"from":from,@"to":to,@"date":date};
    [manage GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"lipengfei%@",rootDic);
        NSMutableArray *array = [NSMutableArray array];
        NSDictionary *data = [rootDic objectForKey:@"data"];
        NSDictionary *trainList = [data objectForKey:@"trainList"];
        for (NSDictionary *dic in trainList) {
            HSData *da = [[HSData alloc]init];
            da.duration = [dic objectForKey:@"duration"];
            da.startTime = [dic objectForKey:@"startTime"];
            da.endTime = [dic objectForKey:@"endTime"];
            da.from = [dic objectForKey:@"from"];
            da.to = [dic objectForKey:@"to"];
            da.trainNo = [dic objectForKey:@"trainNo"];
            da.trainType = [dic objectForKey:@"trainType"];
            da.seatInfos = [dic objectForKey:@"seatInfos"];
            for (NSDictionary *seatDic in da.seatInfos) {
                da.remainNum = [seatDic objectForKey:@"remainNum"];
                NSLog(@"jadsksdakjfadsjkfdsjk:%@",da.remainNum);
                da.seat = [seatDic objectForKey:@"seat"];
                da.seatPrice = [seatDic objectForKey:@"seatPrice"];
            }
            
            [array addObject:da];
        }
        
        
        block(array);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)phoneNumberWhere:(NSString *)phone block:(void(^)(NSMutableArray *phoneArray))block {
    
    NSString *urlStr = @"http://apis.baidu.com/apistore/mobilenumber/mobilenumber";
    NSString * encodedString=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    
    
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manage.requestSerializer setValue:@"149e950fc4bfd3b501c60fa0f0d0a85a" forHTTPHeaderField:@"apikey"];
    NSDictionary *parameter = @{@"phone":[NSString stringWithFormat:@"%@",phone]};
    [manage GET:encodedString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *array = [NSMutableArray array];
        HSData *data = [[HSData alloc]init];
        NSDictionary *retDataDic = [rootDic objectForKey:@"retData"];
        data.phone = [retDataDic objectForKey:@"phone"];
        data.prefix = [retDataDic objectForKey:@"prefix"];
        data.supplier = [retDataDic objectForKey:@"supplier"];
        data.province = [retDataDic objectForKey:@"province"];
        data.city = [retDataDic objectForKey:@"city"];
        data.suit = [retDataDic objectForKey:@"suit"];
        NSLog(@"dddddddddd%@",data.suit);
        [array addObject:data];
        block(array);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //NSLog(@"+++%@",error);
    }];
}
@end
