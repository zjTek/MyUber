//
//  VerifyPhonePage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class VerifyPhonePage: BasePage {
    
    @IBOutlet var number1:UITextField!
    @IBOutlet var number2:UITextField!
    @IBOutlet var number3:UITextField!
    @IBOutlet var number4:UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "确认手机"
        
        setNavigationItem("Close.png", selector:#selector(self.doBack), isRight: false)

    }

    @IBAction func doValueChange(textField:UITextField)
    {
        let tag = textField.tag
        
        if textField.text!.isEmpty
        {
            if tag - 1 > 0
            {
                let prexField = self.view.viewWithTag(tag-1) as! UITextField
                
                prexField.becomeFirstResponder()
                
            }
        } else
        {
            if tag+1 <= 4 {
                let nextField = self.view.viewWithTag(tag+1) as! UITextField
                nextField.becomeFirstResponder()
            }
        }
        
        if tag == 4 {
            textField.resignFirstResponder()
            doVerify()
        }
    }
    
    func doVerify() -> Void
    {
        self.showIndicator("验证中", autoHide: true, afterDelay: true)
        self.performSelector(#selector(self.doShowHomePage), withObject: nil, afterDelay: 1.0)
    }
    
    override func doBack()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doShowHomePage() -> Void
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.showHomePage()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
            }
    

   }
