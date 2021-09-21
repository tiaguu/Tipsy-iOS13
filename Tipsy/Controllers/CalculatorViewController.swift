//
//  ViewController.swift
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

    var tipsyCalculator = TipsyCalculator()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        for button in [zeroPctButton, tenPctButton, twentyPctButton] {
            if button == sender {
                button?.isSelected = true
                tipsyCalculator.updateTip(sender.currentTitle!)
            } else {
                button?.isSelected = false
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = tipsyCalculator.calculateSplitNumber(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tipsyCalculator.updateBill(billTextField.text ?? "0")
        tipsyCalculator.calculatePricePerPerson()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = tipsyCalculator.tip
            destinationVC.split = tipsyCalculator.split
            destinationVC.pricePerPerson = tipsyCalculator.pricePerPerson
        }
    }
    
}

