//
//  ViewModel.swift
//  NCX
//
//  Created by Giovanni Borriello on 26/03/24.
//

import Foundation
import Observation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var country: [Country] = []
    
    func asyncFetchCountryData() async {
        self.country.removeAll()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://restcountries.com/v3.1/all")!)
            let countries = try JSONDecoder().decode([Country].self, from: data)
            for country in countries {
                self.country.append(country)
            }
            self.country.sort { $0.name?.common ?? "error" < $1.name?.common ?? "error"}
        } catch {
            print("Error: \(error)")
        }
    }
}
