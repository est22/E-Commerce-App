//
//  ContentView.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/19.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppDataModel
    var body: some View {
        
        Home()
            .environmentObject(appData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
