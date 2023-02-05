//
//  AppDelegate.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/20.
//

import UIKit
import Branch

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            // do stuff with deep link data (nav to page, display content, etc)
            print(params as? [String: AnyObject] ?? {})
        }
        
        // enable pasteboard check for iOS 15+ only
              if #available(iOS 15.0, *) {
               Branch.getInstance().checkPasteboardOnInstall()
            }
        
        // listener for Branch Deep Link data
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            // do stuff with deep link data (nav to page, display content, etc)
            print(params as? [String: AnyObject] ?? {})
        }
        
        return true
    }
    

    
}
