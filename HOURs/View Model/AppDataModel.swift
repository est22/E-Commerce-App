//
//  AppDataModel.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/20.
//

import SwiftUI

class AppDataModel: ObservableObject {
    
    @Published var currentTab: Tab = .home
    @Published var currentDetailPage: String?
    
    func checkDeepLink(url: URL)->Bool{
        
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else{
            return false
        }
        
        // Update Tabs
        if host == Tab.search.rawValue{
            currentTab = .search
        }
        else if host == Tab.home.rawValue{
            currentTab = .home
        }
        else if host == Tab.settings.rawValue{
            currentTab = .settings
        }
        else {
            return checkInternalLinks(host: host)
        }
        return true
    }
    
    func checkInternalLinks(host: String)->Bool{
        // check if host contains any navigation link ids
        if let index = products.firstIndex(where: {product in
            return product.id == host
        }){
            // change to search tab
            // since navigation links are in search tab
            currentTab = .home
            // setting navigation link selection
            currentDetailPage = products[index].id
            return true
        }
        return false
    }
}

// Tab enum
enum Tab: String{
    case search = "search"
    case home = "home"
    case settings = "settings"
}
