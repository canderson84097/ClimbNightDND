//
//  ClassListTableViewController.swift
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

import UIKit

class ClassListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var classes = [DNDTopLevelResult]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchClasses()
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)

        cell.textLabel?.text = classes[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellToClassDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? ClassDetailTableViewController
                else { return }
            
            let dndClass = classes[indexPath.row]
            
            destination.className = dndClass.name
            destination.classURL = dndClass.url
        }
    }
    
    // MARK: - Helpers
    
    func fetchClasses() {
        DNDClassController.fetchClasses { [weak self] results in
            guard let self = self,
                let results = results
            else { return }
            
            self.classes = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
