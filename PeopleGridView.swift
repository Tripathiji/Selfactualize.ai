//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


import SwiftUI

struct PeopleGridView: View {
    @StateObject var viewModel = PeopleViewModel()

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView { // 1. Wrap the ScrollView in a NavigationView
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.people) { person in
                        NavigationLink(destination: ChatView()) { // 2. Wrap each grid cell in a NavigationLink
                            VStack(alignment: .center) {
//                                Image(systemName: person.image)
                                Image(person.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)  // Set the desired width and height
                                    .clipShape(Circle())  // Clip the image to a circle shape
                                    .overlay(Circle().stroke(Color.white, lineWidth: 1))  // Optional: Add a border around the circle
                                    .shadow(radius: 10)  // Optional: Add a shadow for effect
                                Text(person.name)
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                            }
                            .padding()
                            .cornerRadius(8)
                        }
                    }

                }
                .padding()
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)  // Set the desired width and height
                    .clipShape(Circle())  // Clip the image to a circle shape
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))  // Optional: Add a border around the circle
                    .shadow(radius: 10)  // Optional: Add a shadow for effect
            }
        }
    }
}

// 3. Define the destination for NavigationLink
struct PersonDetailView: View {
    var person: Person

    var body: some View {
        VStack {
            Text(person.name)
            Text(person.bio)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
