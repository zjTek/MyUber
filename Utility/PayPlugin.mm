//
//  PayPlugin.m
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

#import "PayPlugin.h"
#import "UPPayPlugin.h"

@implementation PayPlugin

+(BOOL)startPay:(NSString *)tn mode:(NSString *)mode viewController:(UIViewController *)viewController delegate:(id<UPPayPluginDelegate>)delegate
{
    return [UPPayPlugin startPay:tn mode:mode viewController:viewController delegate:delegate];
}

@end
