//
//  TabContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct TabContentView: View {
    var body: some View {
        TabView {
            TabHomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            TabStoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            TabFavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            TabFunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
