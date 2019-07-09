//
//  ItemDetail.swift
//  iDine
//
//  Created by Catalina on 09/07/2019.
//  Copyright © 2019 Catalina. All rights reserved.
//

import SwiftUI

struct ItemDetail : View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var fave: Favourites
    
    var item: MenuItem
    
    private func likeButton(item: MenuItem) -> some View {
        Button(action: {
            self.fave.add(item: item)
        }) {
            Text("I like it!")
                .font(.headline)
                .padding(Edge.Set([.leading, .trailing]), 15)
                .padding(Edge.Set([.top, .bottom]), 10)
                .background(Color.red)
                .cornerRadius(5)
                .foregroundColor(.white)
        }
    }
    
    private func unlikeButton(item: MenuItem) -> some View {
        Button(action: {
            self.fave.remove(item: item)
        }) {
            Text("I dont like it!")
                .font(.headline)
                .padding(Edge.Set([.leading, .trailing]), 15)
                .padding(Edge.Set([.top, .bottom]), 10)
                .background(Color.red)
                .cornerRadius(5)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -20, y: -5)
            }
            Text(item.description)
                .lineLimit(nil)
                .padding()
            Button(action: {
                self.order.add(item: self.item)
            }) {
                Text("Order this")
                    .font(.headline)
                    .padding(Edge.Set([.leading, .trailing]), 15)
                    .padding(Edge.Set([.top, .bottom]), 10)
                    .background(Color.green)
                    .cornerRadius(5)
                    .foregroundColor(.white)
            }
            if self.fave.items.contains(self.item) {
                unlikeButton(item: self.item)
            } else {
                likeButton(item: self.item)
            }
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

#if DEBUG
struct ItemDetail_Previews : PreviewProvider {
    
    static let order = Order()
    static let favourites = Favourites()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(order)
                .environmentObject(favourites)

        }
    }
}
#endif
