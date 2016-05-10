//
//  YinLianPage.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

class YinLianPage: BasePage,UPPayPluginDelegate, NSURLConnectionDataDelegate  {

    var responseData:NSMutableData?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    
    @IBAction func doPay()
    {
        let url = NSURL(string: YLTnURl)
    
        startPay(url!)
    
    }
    
    func startPay(url:NSURL) -> Void {
        let urlRequest = NSURLRequest(URL: url)
        
        let connect = NSURLConnection(request: urlRequest, delegate: self)
        
        connect?.start()
    }
    
    // recall methods
    func UPPayPluginResult(result: String!) {
        Log(result)
    }
    
    //MARK:---URLConnectionDelegate Methods
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        
        let urlResponse = response as! NSHTTPURLResponse
        
        if urlResponse.statusCode != 200 {
            Log("error status code")
        }else{
            responseData = NSMutableData()
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        
        responseData?.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let result = String(data: responseData!, encoding: NSUTF8StringEncoding)
        
        if result != nil {
            PayPlugin.startPay(result, mode: "01", viewController: self, delegate: self)
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        Log(error.localizedFailureReason!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

  
}
