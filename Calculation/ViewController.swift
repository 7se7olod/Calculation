//
//  ViewController.swift
//  Calculation
//
//  Created by Всеволод on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
 let number = sender.currentTitle!
       
        if stillTyping {
            if (displayResultLabel.text?.count)! < 20 {
    displayResultLabel.text = displayResultLabel.text! + number
        }
    } else {
        displayResultLabel.text = number
        stillTyping = true
    }
}
    
    @IBAction func twoOperandsSighPress(_ sender: UIButton) {
        firstOperand = currentInput
        print(firstOperand)
        stillTyping = false
    }
    
    
    
}
