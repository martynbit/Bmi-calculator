//
//  SecondViewController.swift
//  Bmi calculator
//
//  Created by Martynas Tamulionis on 26/06/2018.
//  Copyright © 2018 Martynas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var emptyLabel: UILabel!
    
    var bmiResultlist = [String]()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        bmiResultlist = defaults.stringArray(forKey: "bmiResultList") ?? []
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        calculation()
        self.view.endEditing(true)
        defaults.set(bmiResultlist, forKey: "bmiResultList")
    }
    
    @IBAction func resultBtn(_ sender: UIButton) {
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "resultsStoryBoard") as? ThirdViewController else {
            return
        }
        
        resultVC.list = bmiResultlist
        self.present(resultVC, animated: true, completion: nil)
    }
    
    

    func calculation() {
            
        if (heightTextField.text?.isEmpty)! || (weightTextField.text?.isEmpty)! {
            emptyLabel.text = "Please fill the form"
        } else {
            let weight = Double(Int(weightTextField.text!)!)
            let height = Double(Int(heightTextField.text!)!) / 100
            let bmi = weight / pow(height, 2)
            let shortenedBmi = String(format: "%.2f", bmi)
            let bmiResult: String = "bmi: \(shortenedBmi)"
            bmiResultlist.append(bmiResult)
            
            if bmi < 18.5 {
                emptyLabel.text = "Your BMI is \(shortenedBmi), you are very severely underweight"
            } else if bmi >= 18.5 && bmi <= 25 {
                emptyLabel.text = "Your BMI is \(shortenedBmi), you are normal weight"
            } else if bmi > 25 {
                emptyLabel.text = "Your BMI is \(shortenedBmi), you are overweight"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

