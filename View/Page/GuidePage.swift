//
//  GuidePage.swift
//  MyUber
//
//  Created by Tek on 16/5/9.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: BasePage {

    @IBOutlet var backImageView:UIImageView?
    
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    var location:Location!
    
    
    
    convenience init()
    {
        var nibNameOrNil = String?("GuidePage")
        
        // Given than the xib was deleted or not exist
        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "nib") == nil {
            nibNameOrNil = nil
        }
        
        self.init(nibName:nibNameOrNil,bundle: nil)
    }
    
 
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

           }

    func doAnimation() -> Void {
        
        var images:[UIImage] = []
        var image:UIImage?
        var imageName:String?
        
        for index in 0...67 {
            imageName = "logo-" + String(format: "%03d", index)
            image = UIImage(named: imageName!)
            
            images.insert(image!, atIndex: index)
            
        }
        
        backImageView?.animationImages = images
        backImageView?.animationRepeatCount = 1
        backImageView?.animationDuration = 5
        
        backImageView?.startAnimating()
        
        UIView.animateWithDuration(0.7, delay: 5, options: .CurveEaseIn, animations: {
            self.backView.alpha = 1.0
            self.player.play()
            }) { finished in
                print("Animation End")
        }
    }
    
    
    func initPlayVideo() -> Void {
        
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = backView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        
        backView.layer.insertSublayer(playerLayer, atIndex: 0)
        
        backView.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GuidePage.didFinishedVideo(_:)), name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)
    }
    
    func didFinishedVideo(sender:NSNotification) -> Void {
        
        let item = sender.object as! AVPlayerItem
        
        item.seekToTime(kCMTimeZero)
        
        self.player.play()
    }
    
    
    @IBAction func doLogin(){
        
        location = Location()
        location.startLocation()
        
    }
    
    @IBAction func doRegister(){
        
        let page = CreateAccountPage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(navPage, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
          }
    

   }
