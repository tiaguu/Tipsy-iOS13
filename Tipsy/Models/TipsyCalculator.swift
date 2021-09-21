//
//  TipsyCalculator.swift
//  Tipsy
//
//  Created by Tiago Teodoro on 05/02/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TipsyCalculator {
    
    var tip : Double = 0.1
    var split : Double = 2
    var bill : Double = 0
    var pricePerPerson : Double = 0
    
    mutating func updateTip(_ title : String) {
        if title == "0%" {
            tip = 0.0
        } else if title == "10%" {
            tip = 0.1
        } else {
            tip = 0.2
        }
    }
    
    mutating func calculateSplitNumber(_ value : Double) -> String {
        split = value
        return String(format: "%.0f", value)
    }
    
    mutating func updateBill(_ billText : String) {
        bill = Double(billText) ?? 0
    }
    
    mutating func calculatePricePerPerson() {
        pricePerPerson = (bill + (bill * tip)) / split
    }
}
