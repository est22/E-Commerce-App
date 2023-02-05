//
//  Home.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/20.
//

import SwiftUI
import Branch



struct Home: View {
    
    @EnvironmentObject var appData: AppDataModel

    
    var body: some View {
        TabView(selection: $appData.currentTab) {
            
            Text("Search")
                .tag(Tab.search)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            HomeView()
                .environmentObject(appData)
                .tag(Tab.home) // search -> home 
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        
        Home()
    }
}


// Home View
struct HomeView: View{
    @EnvironmentObject var appData: AppDataModel
    
    @State var items : [Any] = []
    @State var sheet = false
    
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
            .navigationTitle("Near Me")

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
                    
                    Spacer()
                    

                    
                    Text(product.title)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    HStack{
                        
                        Text(product.produtPrice)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
//                            Image(systemName: "square.and.arrow.up")
//
                            // ShareSheet
                            if #available(iOS 16.0, *) {
//                                let qrCode = BranchQRCode()
//                                let buo = BranchUniversalObject()
//                                let lp = BranchLinkProperties()
//                                // display the QR code directly in a share sheet
//                                qrCode.showShareSheetWithQRCode(from: self, anchor: nil, universalObject: buo, linkProperties: lp) { error in
//                                    //Showing a share sheet with the QR code
//                                }


                                // Share Sheet
                                ShareLink(
                                    item: URL(string: "hoursapp://\(product.id)")!,
                                    subject: Text("HOURs"),
                                    message: Text("Check this out!")
                    
                                )


                            } else {
                                // Fallback on earlier versions

 
                            }

                        })

                        
                    }
                    
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

