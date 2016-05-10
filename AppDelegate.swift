//
//  AppDelegate.swift
//  MyUber
//
//  Created by Tek on 16/5/9.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func showHomePage() -> Void
    {
        let page = HomePage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.window?.rootViewController = navPage
        self.window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(application: UIApplication) {
            }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
            }

    func applicationDidBecomeActive(application: UIApplication) {
            }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

