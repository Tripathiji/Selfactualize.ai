//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


struct Person: Identifiable, Codable {
    var id: String { name }
    var name: String
    var bio: String
    var image: String
}

struct People: Codable {
    var people: [Person]
}
