//
//  ViewController.swift
//  Calculation
//
//  Created by Всеволод on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayResultLabel: UILabel!
    var dotIsPlaced = false
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSigh: String = ""
    
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
        operationSigh = sender.currentTitle!
        firstOperand = currentInput
      
        stillTyping = false
        dotIsPlaced = false
    }
    
    func operateWithTwoOperands (operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySighPress(_ sender: UIButton) {
        if stillTyping{
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSigh {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
        default: break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSigh = ""
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func precentageButton(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
    }
}
