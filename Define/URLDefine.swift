//
//  URLDefine.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import Foundation

#if buildAppStore

#endif

func ServerAddress() -> String {
    
    var address = "http://"
    
    #if AppStore
        address = ""
    
    #endif
    
    return address
}

let YLTnURl = ""