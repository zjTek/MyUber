//
//  UserInfoPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class UserInfoPage: BasePage, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var avatar:UIImageView!
    @IBOutlet var backUserView:UIView!
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "建立基本资料"
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
        
        setNavigationItem("Back.png", selector: #selector(UserInfoPage.doBack), isRight: false)
        setNavigationItem("下一步", selector: #selector(UserInfoPage.doRight), isRight: true)

    }
    
    @IBAction func doSetAvatar(sender:UIButton)
    {
        let picker = UIImagePickerController()
        
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    override func doRight()
    {
        let page = AddPayPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        avatar.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }
    

    
}
