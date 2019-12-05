//
//  SpellListTableViewController.swift
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

import UIKit

class SpellListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpellCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension SpellListTableViewController: UISearchBarDelegate {
    
}
