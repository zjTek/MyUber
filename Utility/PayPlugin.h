//
//  PayPlugin.h
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UPPayPluginDelegate.h"

@interface PayPlugin : NSObject

+(BOOL)startPay:(NSString *)tn mode:(NSString *)mode viewController:(UIViewController *)viewController delegate:(id<UPPayPluginDelegate>)delegate;

@end
