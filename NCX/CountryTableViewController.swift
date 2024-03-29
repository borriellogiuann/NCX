//
//  CountryTableViewController.swift
//  NCX
//
//  Created by Giovanni Borriello on 26/03/24.
//

import UIKit
import SwiftUI

class CountryTableViewController: UITableViewController {
    
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
                self.tableView.reloadData() // Reload table view data on the main thread
            }
        }
    }


    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        let country = countries[indexPath.row]
        cell.countryImageView.image = UIImage(named: "placeholder.png")
        cell.countryLabel.text = country.name?.common
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as! CountryDetailViewController
            if let index = tableView.indexPathForSelectedRow?.row {
                let country = countries[index]
                destination.country = country
            }
        }
    }
}
