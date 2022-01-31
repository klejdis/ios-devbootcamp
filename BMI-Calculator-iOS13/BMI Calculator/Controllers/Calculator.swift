//
//  Calculator.swift
//  BMI Calculator
//
//  Created by klejdisjorgji on 17.1.22.
//  Copyright © 2022 Angela Yu. All rights reserved.

import Foundation
import UIKit

struct Calculator{
    
    var bmi: BMI?
    
    mutating func calculateBmi(weight: Float, height: Float){
        let bmiValue = weight / (height * height)
        
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "EAT MORE!", color: UIColor.blue)
        }else if(bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "FIt AS A FIDDLE!", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "EAT LESS PIES", color: UIColor.red)
        }
    }
    
    func getBmiText() -> String{
        return String(format:"%.2f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "NO advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    
    
    
}
