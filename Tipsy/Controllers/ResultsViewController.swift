//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Penkov Alexander on 21.02.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    public func setupUI(totalPerPersonValue: Double, persons: Int, tips: Double) {
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPersonValue)
        descriptionLabel.text = "Split between \(persons) people, with \((tips - 1) * 10)% tip."
    }
}
