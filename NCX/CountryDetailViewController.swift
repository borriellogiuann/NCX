//
//  CountryDetailViewController.swift
//  NCX
//
//  Created by Giovanni Borriello on 29/03/24.
//

import UIKit
import SwiftUI

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryCurrency: UILabel!
    @IBOutlet weak var countryLanguages: UILabel!
    @IBOutlet weak var countryBorders: UILabel!
    @IBOutlet weak var countryTimezones: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.width*2)
        if let flags = country?.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.countryImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        self.navigationItem.title = country?.name?.common
        
        countryCapital.text = country?.capital?.first ?? "No Capital"
        countryRegion.text = country?.region ?? "No Region"
        countryPopulation.text = "\(country?.population ?? 0)"
        countryCurrency.text = country?.currencies?.first?.value.name ?? "No Currencies"
        countryLanguages.text = country?.languages?.keys.joined(separator: ", ") ?? "No Languages"
        countryBorders.text = country?.borders?.joined(separator: ", ") ?? "No Borders"
        countryTimezones.text = country?.timezones?.joined(separator: ", ") ?? "No Timezones"
    }
}
