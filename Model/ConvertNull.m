//
//  ConvertNull.m
//  LPBaiduProduct
//
//  Created by hoomsun on 16/5/27.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "ConvertNull.h"

@implementation ConvertNull
+(NSString*)convertNull:(id)object{
    
    if ([object isEqual:[NSNull null]]) {
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (object==nil){
        return @"无";
    }
    return object;
    
}
@end
