//
//  HSDataModel.h
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/25.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSDataModel : NSObject
//去哪儿的调用接口数据
+(void)getGoWhereDataVersion:(NSString *)version andFrom:(NSString *)from andTo:(NSString *)to andDate:(NSString *)date block:(void(^)(NSMutableArray *goWhereArray))block;

+(void)phoneNumberWhere:(NSString *)phone block:(void(^)(NSMutableArray *phoneArray))block;


@end
