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
    @Published var country: [Country]?
    
    func asyncFetchCountryData(countryName: String) async {
        var counter = 0
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://restcountries.com/v2/name/\(countryName)")!)
                let countries = try JSONDecoder().decode([Country].self, from: data)
                for country in countries {
                    print("Country Name: \(country.name)")
                    print("Domain: \(country.topLevelDomain)")
                    print("Alpha2Code: \(country.alpha2Code)")
                    print("Alpha3Code: \(country.alpha3Code)")
                    print("Calling Codes: \(country.callingCodes)")
                    print("Capital: \(country.capital)")
                    print("Alt Spellings: \(country.altSpellings)")
                    print("Region: \(country.region)")
                    print("Subregion: \(country.subregion)")
                    print("Population: \(country.population)")
                    //                  print("Latlng: \(country.latlng)")
                    //                  print("Demonym: \(country.demonym)")
                    //                  print("Area: \(country.area)")
                    //                  print("Gini: \(country.gini)")
                    print("Timezones: \(country.timezones)")
                    print("Borders: \(country.borders)")
                    print("Native Name: \(country.nativeName)")
                    //                  print("Numeric Code: \(country.numericCode)")
                    print("Currencies: \(country.currencies)")
                    print("Languages: \(country.languages)")
                    //                  print("Translations: \(country.translations)")
                    print("Flag: \(country.flag)")
                    //                  print("Regional Blocs: \(country.regionalBlocs)")
                    //                  print("CIOC: \(country.cioc)")
                    await MainActor.run{
                        var tempCountry = self.country
                        tempCountry?[counter] = country
                        self.country = tempCountry
                    }
                    counter+=1
                }
            } catch {
                print("Error: \(error)")
            }
            
        }
    }
    
}
