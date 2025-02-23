//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanger(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        var tips = 0.0
        if zeroPctButton.isSelected {
            tips = 1.0
        } else if tenPctButton.isSelected {
            tips = 1.1
        } else if twentyPctButton.isSelected {
            tips = 1.2
        }
        
        let result = ((Double(billTextField.text ?? "") ?? 1.0) * tips) / Double(splitStepper.value)

        let resultVC = ResultsViewController()
        resultVC.setupUI(totalPerPersonValue: result, persons: Int(splitStepper.value), tips: tips)
        resultVC.modalPresentationStyle = .formSheet
        self.present(resultVC, animated: true)
    }
    
}

