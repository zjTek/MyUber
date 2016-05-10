//
//  CreateAccountPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class CreateAccountPage: BasePage {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "创建账户"
        
        setNavigationItem("下一步", selector: #selector(CreateAccountPage.doRight), isRight: true)
        setNavigationItem("取消", selector: #selector(CreateAccountPage.doBack), isRight: true)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    override func doRight()
    {
        
        let page = UserInfoPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    @IBAction func doSelectCountry(sender:UIButton)
    {
        let page = SelectCountryPage()
        let NavPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(NavPage, animated: true, completion: nil)
    }
    
}
