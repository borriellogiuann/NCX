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
    @IBOutlet weak var countryName: UILabel!
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
        
        countryName.text = country?.name?.common
        countryCapital.text = country?.capital?.first
        countryRegion.text = country?.region
        countryPopulation.text = country?.population?.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
