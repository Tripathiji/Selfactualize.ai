//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) { // Spacing set to 0 to ensure buttons are adjacent
                createButton(imageName: "hero", destination: PeopleGridView())
                createButton(imageName: "video", destination: VideoPlayerView(fileName: "David", fileType: "mov"))
                createButton(imageName: "audio", destination: VideoPlayerView(fileName: "audio", fileType: "mp3"))
            }
        }
    }

    // Function to create a button with an image and an action
    func createButton(imageName: String, destination: some View) -> some View {
        NavigationLink(destination: destination) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
        }
        .buttonStyle(PlainButtonStyle())
    }}


