//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//


import Foundation


class PeopleViewModel: ObservableObject {
    @Published var people = [Person]()

    init() {
        load()
    }

    func load() {
        guard let url = Bundle.main.url(forResource: "Heroes", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }

        do {
            let decodedData = try JSONDecoder().decode(People.self, from: data)
            self.people = decodedData.people
            print(decodedData.people)
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
