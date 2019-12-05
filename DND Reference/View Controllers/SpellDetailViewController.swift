//
//  SpellDetailViewController.swift
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

import UIKit

class SpellDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var spellName: String?
    var spellURL: URL?
    
    // MARK: - Outlets
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var componentsLabel: UILabel!
    @IBOutlet weak var concentrationLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var castingTimeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Helpers
    
    func setupViews() {
        
        title = spellName
        
        guard let spellURL = spellURL else { return }
        
        DNDSpellController.fetchSpellDetails(from: spellURL) { spellDetails in
            
            guard let spellDetails = spellDetails else { return }
            
            DispatchQueue.main.async {
                let level = spellDetails.level.intValue > 0 ? spellDetails.level : 0
                self.levelLabel.text = "Level \(level)"
                let components = spellDetails.components.joined(separator: ", ")
                self.componentsLabel.text = components
                self.concentrationLabel.text = spellDetails.concentration
                self.rangeLabel.text = spellDetails.range
                self.castingTimeLabel.text = spellDetails.castingTime
                let spellDescription = spellDetails.spellDescription.joined(separator: " ")
                self.descriptionTextView.text = spellDescription
            }
        }
    }
}
