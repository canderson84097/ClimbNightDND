//
//  ClassDetailTableViewController.swift
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

import UIKit

class ClassDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var classURL: URL? {
        didSet {
            fetchClassDetails()
        }
    }
    var className: String? {
        didSet {
            title = className
            fetchSpellDetails()
        }
    }
    var classDetails: DNDClass?
    var spells = [DNDTopLevelResult]()
    
    // MARK: - Outlets
    
    @IBOutlet weak var hitDiceLabel: UILabel!
    @IBOutlet weak var proficienciesLabel: UILabel!
    @IBOutlet weak var savingThrowsLabel: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide empty cells
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpellCell", for: indexPath)

        let spell = spells[indexPath.row]
        cell.textLabel?.text = spell.name

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Helpers
    
    func fetchClassDetails() {
        guard let url = classURL else { return }
        
        DNDClassController.fetchClassDetails(from: url) { [weak self] classDetails in
            guard let self = self else { return }
            
            self.classDetails = classDetails
            
            DispatchQueue.main.async {
                self.setupViews()
            }
        }
    }
    
    func fetchSpellDetails() {
        guard let className = className else { return }
        
        DNDSpellController.fetchSpells(forClass: className) { [weak self] results in
            guard let self = self,
                let results = results
            else { return }
            
            self.spells = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupViews() {
        guard let classDetails = self.classDetails else { return }
        
        hitDiceLabel.text = "\(classDetails.hitDice)"
        let proficiencies = classDetails.proficiencies.joined(separator: ", ")
        proficienciesLabel.text = proficiencies
        let savingThrows = classDetails.savingThrows.joined(separator: ", ")
        savingThrowsLabel.text = savingThrows
    }
}
