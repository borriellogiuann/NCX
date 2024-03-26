//
//  ViewController.swift
//  NCX
//
//  Created by Giovanni Borriello on 25/03/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @ObservedObject var viewModel = ViewModel()
    var countries: [Country]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let countryName = "Italy" //Esempio Iniziale
        Task {
            await viewModel.asyncFetchCountryData(countryName: countryName)
            countries = viewModel.country
        }
    }
}
