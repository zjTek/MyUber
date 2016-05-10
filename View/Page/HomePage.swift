//
//  HomePage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class HomePage: BasePage {
    
    @IBOutlet var leftView:UIView?
    
    var backControl:UIControl!
    var showingLeft:Bool!
    var userCenterPage:UserCenterPage!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        addBackControl()
        
        setNavigationItem("Left", selector: #selector(self.doShowLeft), isRight: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.addLeftView()
        self.addUserCenterView()
    }
    
    func doTapCenter(sender:UIButton) -> Void
    {
        if showingLeft! {
            showCenterPanel()
        }
     
    }
    
    func addBackControl() -> Void {
        
        if backControl == nil
        {
            let frame = self.navigationController!.view.bounds
            backControl = UIControl(frame: frame)
            backControl.backgroundColor = UIColor.blackColor()
            backControl.alpha = 0.5
            backControl.addTarget(self, action: #selector(self.doTapCenter(_:)), forControlEvents: .TouchUpInside)
            
            self.navigationController!.view.addSubview(backControl)
        }
    }
    
    func addUserCenterView()
    {
        userCenterPage = UserCenterPage()
        userCenterPage.view.frame = leftView!.bounds
        
        leftView?.addSubview(userCenterPage!.view)
    }
    
    
    @IBAction func doShowLeft()
    {
        if showingLeft!{
            showCenterPanel()
        }else
        {
            showLeftPanel()
        }
    }

    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        showingLeft = false
    }
    
    
    func addLeftView() -> Void
    {
        if leftView == nil
        {
            var frame:CGRect! = self.navigationController!.view.bounds
            
            frame.origin.x = -frame.size.width+PanWidth
            frame.size.width -= PanWidth
            
            leftView = UIView(frame: frame)
            leftView?.backgroundColor = UIColor.blackColor()
            self.navigationController!.view.addSubview(leftView!)
        }
    }
    
    func showCenterView(view:UIView, offSet:CGFloat, shadow:Bool)
    {
        if shadow
        {
            view.layer.shadowColor = UIColor.blackColor().CGColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSizeMake(offSet, offSet)
        }else
        {
            view.layer.cornerRadius = 0.0
            view.layer.shadowOpacity = 0.0
            view.layer.shadowOffset = CGSizeMake(offSet, offSet)
        }
    }
    
    func showLeftPanel()
    {
        showingLeft = false
        showCenterView(leftView!, offSet: -2, shadow: true)
        
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: { 
            var frame = self.leftView?.frame
            frame?.origin.x = 0
            self.leftView?.frame = frame!
            
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = (frame?.size.width)! - PanWidth
            self.navigationController?.navigationBar.frame = frame!
            
        }) { (finished:Bool) in
                if finished
                {
                 self.navigationController!.view.bringSubviewToFront(self.backControl)
                
                 self.navigationController!.view.bringSubviewToFront(self.leftView!)
                }
        }
    }
    
    func showCenterPanel()
    {
        showingLeft = false
        
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: { 
            
            var frame = self.leftView?.frame
            frame?.origin.x = -frame!.size.width
            self.leftView?.frame = frame!
            
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = 0
            self.navigationController?.navigationBar.frame = frame!
        }) { (finished:Bool) in
                if finished
                {
                    self.navigationController!.view.sendSubviewToBack(self.backControl)
                    self.showCenterView(self.leftView!, offSet: 0, shadow: false)
                }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

}
