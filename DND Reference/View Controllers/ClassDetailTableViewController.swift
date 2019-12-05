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
    
    var className: String? {
        didSet {
            title = className
            fetchSpells()
        }
    }
    var classURL: URL? {
        didSet {
            fetchClassDetails()
        }
    }
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
        if segue.identifier == "CellToSpellDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? SpellDetailViewController
            else { return }
            
            let spell = spells[indexPath.row]
            
            destination.spellURL = spell.url
        }
    }
    
    // MARK: - Helpers
    
    func fetchClassDetails() {
        guard let url = classURL else { return }
        
        DNDClassController.fetchClassDetails(from: url) { classDetails in
            
            guard let classDetails = classDetails else { return }
            
            DispatchQueue.main.async {
                self.hitDiceLabel.text = "d\(classDetails.hitDice)"
                let proficiencies = classDetails.proficiencies.joined(separator: ", ")
                self.proficienciesLabel.text = proficiencies.capitalized(with: Locale.current)
                let savingThrows = classDetails.savingThrows.joined(separator: ", ")
                self.savingThrowsLabel.text = savingThrows
            }
        }
    }
    
    func fetchSpells() {
        guard let className = className else { return }
        
        DNDSpellController.fetchSpells(forClass: className) { [weak self] results in
            guard let self = self,
                let results = results
            else { return }
            
            self.spells = results.sorted(by: { $0.name < $1.name })
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupViews() {
        
    }
}
