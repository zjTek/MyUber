//
//  UserCenterPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class UserCenterPage: BasePage {
    
    var owner : BasePage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doSetting()
    {
        let own = self.owner as! HomePage
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
