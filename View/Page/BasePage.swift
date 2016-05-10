//
//  BasePage.swift
//  MyUber
//
//  Created by Tek on 16/5/9.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class BasePage: BaseViewController {
    
    @IBOutlet var backView:UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    func setNavigationItem(title:String, selector:Selector, isRight:Bool) -> Void {
        
        
        var item:UIBarButtonItem!
        
        if title.hasPrefix("png") {
            item = UIBarButtonItem(image: UIImage(named: title), style: .Plain, target: self, action: selector)
        } else{
            item = UIBarButtonItem(title: title, style:.Plain, target: self, action: selector)
        }
        
        item.tintColor = UIColor.darkGrayColor()
        
        if isRight {
            self.navigationItem.rightBarButtonItem = item
        } else{
            self.navigationItem.leftBarButtonItem = item
        }
    }
    
    func doRight() -> Void  {
        
    }
    
    func doBack() -> Void {
        if self.navigationController?.viewControllers.count>1 {
            
            self.navigationController?.popViewControllerAnimated(true)
        }else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    

   }
