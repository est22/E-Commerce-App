//
//  Home.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/20.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var appData: AppDataModel
    var body: some View {
        TabView(selection: $appData.currentTab) {
            
            Text("Home")
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            SearchView()
                .environmentObject(appData)
                .tag(Tab.search)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// Search View
struct SearchView: View{
    @EnvironmentObject var appData: AppDataModel
    
    var body: some View {
        NavigationView{
            
            List {
                
                // List of available products
                ForEach(products){product in
                    
                    // Setting tag and selection so that whenever we update selection that navigation link will be called
                    
                    NavigationLink(tag: product.id,selection: $appData.currentDetailPage) {
                        DetailView(product: product)
                        
                    
                
                    
                } label: {
                    HStack(spacing: 15){
                        Image(product.produtImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(product.title)
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            
                            Text(product.produtPrice)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                    }
                }
                    
                    
                }
            }
            .navigationTitle("Search")
            //test
            .toolbar{
                Button("Go to nav link 3"){
                    appData.currentDetailPage = products[2].id
                }
            }
        }
    }
   
    // Detail View
    @ViewBuilder
    func DetailView(product: Product)-> some View{
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(product.produtImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .cornerRadius(1)
                
                VStack(alignment: .leading, spacing:12) {
                    Text(product.title)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    Text(product.produtPrice)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text(product.description)
                        .multilineTextAlignment(.leading)
                    
                    
                }
                .padding()
            
            }
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
    }

}

