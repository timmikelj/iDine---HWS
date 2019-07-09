//
//  FavouritesView.swift
//  iDine
//
//  Created by Catalina on 09/07/2019.
//  Copyright © 2019 Catalina. All rights reserved.
//

import SwiftUI

struct FavouritesView : View {
    
    @EnvironmentObject var favourites: Favourites

    var body: some View {
        NavigationView {
            List {
                ForEach(favourites.items) { section in
                    ItemRow(item: section)
                }
            }
            .navigationBarTitle(Text("Favourites"))
            .listStyle(.grouped)
        }
    }
}

#if DEBUG
struct FavouritesView_Previews : PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
#endif
