//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


import SwiftUI

struct TabbedAppView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            // Chat Tab
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.fill")
                    Text("chat")
                }
                .tag(1)

            // Bookmark Tab
            Text("Bookmark")
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmark")
                }
                .tag(2)
        }
    }
}
