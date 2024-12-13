//
//  ViewController.swift
//  calculator
//
//  Created by Ayush Rajpal on 01/04/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var displayLable: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
        
        private var displayValue: Double {
            get {
                guard let number = Double(displayLable.text!) else {
                    fatalError("Cannot convert display label text to a Double.")
                }
                return number
            }
            set {
                displayLable.text = String(newValue)
            }
        }
        
        private var calculator = CalculatorLogic()
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
               
               if let numValue = sender.currentTitle {
                   
                   if isFinishedTypingNumber {
                       displayLable.text = numValue
                       isFinishedTypingNumber = false
                   } else {
                       
                       if numValue == "." {
                           
                           let isInt = floor(displayValue) == displayValue
                           
                           if !isInt {
                               return
                           }
                       }
                       displayLable.text = displayLable.text! + numValue
                   }
               }
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
                
                isFinishedTypingNumber = true
                
                calculator.setNumber(displayValue)
                
                if let calcMethod = sender.currentTitle {
         
                    if let result = calculator.calculate(symbol: calcMethod) {
                        displayValue = result
                    }
                }
    }
    
    
}

