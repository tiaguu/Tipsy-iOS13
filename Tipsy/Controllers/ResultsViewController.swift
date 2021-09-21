//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tiago Teodoro on 05/02/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tip : Double?
    var split : Double?
    var pricePerPerson : Double?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(pricePerPerson ?? 0.0)
        settingsLabel.text = "Split between \(Int(split!)) people, with \(Int(tip! * 100)) % tip"
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
