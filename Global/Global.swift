//
//  Global.swift
//  MyUber
//
//  Created by Tek on 16/5/9.
//  Copyright © 2016年 Tek. All rights reserved.
//

import Foundation
import UIKit

func isSytemiOS8() -> Bool {
    
    let version:NSString = UIDevice.currentDevice().systemVersion as NSString
    
    if version.floatValue - IOS8 < 0.001{
        return true
    }
    
    return false
}

