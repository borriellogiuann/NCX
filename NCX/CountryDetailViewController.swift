//
//  CountryDetailViewController.swift
//  NCX
//
//  Created by Giovanni Borriello on 29/03/24.
//

import UIKit
import SwiftUI

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var countryImage: UIImageView! //Not added yet
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryCurrency: UILabel! //Not added yet
    @IBOutlet weak var countryLanguages: UILabel! //Not added yet
    @IBOutlet weak var countryBorders: UILabel! //Not added yet
    @IBOutlet weak var countryTimezones: UILabel! //Not added yet
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = country?.name?.common
        
        if let flags = country?.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.countryImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        countryCapital.text = country?.capital?.first
        countryRegion.text = country?.region
        countryPopulation.text = country?.population?.description
        
    }
}
