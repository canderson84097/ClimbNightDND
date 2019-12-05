//
//  SpellDetailViewController.swift
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

import UIKit

class SpellDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var componentsLabel: UILabel!
    @IBOutlet weak var concentrationLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var castingTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
