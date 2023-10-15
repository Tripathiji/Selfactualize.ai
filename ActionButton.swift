//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


import SwiftUI

struct ActionButton: View {
    var iconName: String
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)  // Adjust vertical padding as needed
            .background(Color.white)
            .foregroundColor(.black)
            .clipShape(Capsule())  // Use Capsule shape for rounded ends
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
        }
    }
}
