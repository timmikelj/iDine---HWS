//
//  TabView.swift
//  iDine
//
//  Created by Catalina on 09/07/2019.
//  Copyright © 2019 Catalina. All rights reserved.
//

import SwiftUI

struct TabView : View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabbedView {
            ContentView()
                .tabItem {
                    VStack {
                        Image("system-list")
                        Text("Menu")
                    }
                }.tag(0)
            OrderView()
                .tabItem {
                    VStack {
                        Image("system-compose")
                        Text("Order")
                    }
                }.tag(1)
            FavouritesView()
                .tabItem {
                    VStack {
                        Image("system-heart")
                        Text("Favourites")
                    }
                }.tag(2)
        }
    }
}

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static let order = Order()
    static var previews: some View {
        TabView().environmentObject(order)
    }
}
#endif
