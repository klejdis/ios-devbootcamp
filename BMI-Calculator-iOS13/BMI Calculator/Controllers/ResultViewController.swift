//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by klejdisjorgji on 14.1.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiAdvice: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    var bmi: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmi
        bmiAdvice.text = advice
        resultBackground.backgroundColor = color
        
    }
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
