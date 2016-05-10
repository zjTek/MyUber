//
//  AddPayPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class AddPayPage: BasePage, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView:UITableView!
    var datas:[PayInfo]!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "添加付款方式"
        setNavigationItem("Back.png", selector: #selector(AddPayPage.doBack), isRight: false)
        setNavigationItem("验证", selector: #selector(AddPayPage.doVerifyPhone), isRight: true)
        
        initDatas()
        
        // create a reusable cell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellID1")
        
        tableView.reloadData()

    }
    
    func doVerifyPhone() -> Void
    {
        
        let page = VerifyPhonePage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(navPage, animated: true, completion: nil)
        
    }
    
    func initDatas() -> Void
    {
        
        var data:PayInfo!
        let dict = [
            "百度钱包":"BaiduWallet.png",
            "银联":"YinLian.png",
            "支付宝":"Alipay.png",
            "国际信用卡":"CreditCard.png"
                    ]
        
        datas = []
        for (key,value) in dict {
            data = PayInfo()
            
            data.name = key
            data.icon = value
            
            datas.append(data)
            
        }
    }

    
//MARK:   ---TABLEVIEW DELEGATE
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        cell.selectedBackgroundView?.backgroundColor = UIColor.clearColor()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier:String = "CellID1"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        
        let data = datas[indexPath.row]
        
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.name
        cell.imageView?.image = UIImage(named: data.icon)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let page = YinLianPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

   
}
