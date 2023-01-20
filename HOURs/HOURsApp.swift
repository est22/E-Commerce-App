//
//  HOURsApp.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/19.
//

import SwiftUI

@main
struct HOURsApp: App {
    @StateObject var appData: AppDataModel = AppDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL { url in
                    // used to fetch the deep link url
                    if appData.checkDeepLink(url: url){
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
