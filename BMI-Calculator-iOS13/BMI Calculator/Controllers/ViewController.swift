

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightlSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var bmiValue: String?
    var calculator: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateBtn(_ sender: UIButton) {
        calculator.calculateBmi(weight: weightSlider.value, height: heightlSlider.value)
        bmiValue = calculator.getBmiText()

        self.performSegue(withIdentifier: "calculateBmiSegue", sender: self)
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.2f", sender.value)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "calculateBmiSegue"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = bmiValue
            destinationVC.advice = calculator.getAdvice()
            destinationVC.color = calculator.getColor()
        }
    }

    
}



