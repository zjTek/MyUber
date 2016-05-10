//
//  SettingPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class SettingPage: BasePage {
    
    @IBOutlet var userBackView:UIView?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setNavigationItem("Close.png", selector: #selector(self.doBack), isRight: false)
        
        var frame = userBackView!.frame
        frame.origin.y = 64
        userBackView?.frame = frame
        self.view.addSubview(userBackView!)

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

  
}
