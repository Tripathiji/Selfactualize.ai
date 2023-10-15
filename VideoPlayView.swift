//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var fileName: String
    var fileType: String

    @State private var player: AVPlayer

    init(fileName: String, fileType: String) {
        self.fileName = fileName
        self.fileType = fileType
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileType) {
            _player = State(initialValue: AVPlayer(url: url))
        } else {
            _player = State(initialValue: AVPlayer())  // Empty player if file not found
        }
    }

    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onDisappear() {
                player.pause()
            }
    }
}


struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        // Assuming there's a "sample.mp4" file in the project
        VideoPlayerView(fileName: "sample", fileType: "mp4")
    }
}
