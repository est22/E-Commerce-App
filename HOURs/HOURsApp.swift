//
//  HOURsApp.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/19.
//

import SwiftUI
import Branch

@main
struct HOURsApp: App {
    @StateObject var appData: AppDataModel = AppDataModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                // Branch Code Snippet
//                .onOpenURL(perform: {url in
//                    Branch.getInstance().handleDeepLink(url)
//                })
                // Custom Code Snippet
                .onOpenURL { url in
                    if appData.checkDeepLink(url: url){
                        Branch.getInstance().handleDeepLink(url)
                        print("FROM DEEP LINK")
                    } else {
                        print("FALL BACK DEEP LINK")
                    }
                }
        }
    }
}

// Integrating Deep Link
// 1. create a url scheme for how to call your url
// EG: hoursapp://
