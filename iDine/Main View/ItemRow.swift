//
//  ItemRow.swift
//  iDine
//
//  Created by Catalina on 09/07/2019.
//  Copyright © 2019 Catalina. All rights reserved.
//

import SwiftUI

struct ItemRow : View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourites: Favourites
    
    static let colors: [String: Color] = ["D": .purple,
                                          "G": .black,
                                          "N": .red,
                                          "S": .blue,
                                          "V": .green]
    
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item).environmentObject(order).environmentObject(favourites)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1.5))
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("USD$\(item.price)")
                }
                Spacer()
                ForEach(item.restrictions.identified(by: \.self)) { restriction in
                    Text(restriction).font(.caption).fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle()).foregroundColor(.white)
                }
            }
        }
    }
}

#if DEBUG
struct ItemRow_Previews : PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
#endif
