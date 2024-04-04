//
//  FlagGeneratorViewController.swift
//  NCX
//
//  Created by Giovanni Borriello on 04/04/24.
//

import UIKit
import SwiftUI

class FlagGeneratorViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var generatorLabel: UIButton!
    
    @ObservedObject var viewModel = ViewModel()
    var countries: [Country] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Task {
            await viewModel.asyncFetchCountryData()
            await MainActor.run {
                self.countries = viewModel.country
            }
        }
    }
    
    
    @IBAction func randomFlagGenerator(_ sender: UIButton) {
        Task { 
            @MainActor in
            guard let randomCountry = countries.randomElement() else {
                return
            }
            
            countryLabel.text = randomCountry.name?.common
            
            if let flags = randomCountry.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    countryFlag.image = UIImage(data: data)
                } catch {
                    print("Error fetching flag data:", error.localizedDescription)
                }
            }
        }
    }
}
