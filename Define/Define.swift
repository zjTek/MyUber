//
//  Define.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import Foundation
import UIKit

let LoadingTip = "加载中...."
let IOS8:Float = 8.0
let ScreenHeight = UIScreen().bounds.size.height

let PanWidth:CGFloat = 100

func Log(message:String, function:String = #function) -> Void {
    
    #if DEBUG
        print("Log:\(message),\(function)")
    #else
    
    #endif
}

func isiPhone5() -> Bool {
    
    #if os(iOS)
        Log("IOS")
    #else
    
    #endif
    
    if ScreenHeight == 568{
        return true
    }
    
    return false
}



