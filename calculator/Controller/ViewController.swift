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
    
    var isFirstNumber: Bool = true
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let numVal = sender.titleLabel?.text {
            if isFirstNumber {
                displayLable.text = numVal
                isFirstNumber = false
            }
            else{
                if numVal == "." {
                    if displayLable.text?.contains(".") == false {
                        displayLable.text?.append(numVal)
                    }
                }
                else{
                    displayLable.text?.append(numVal)
                }
            }
        }
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        isFirstNumber = true
        guard let number = Double(displayLable.text!) else {
            fatalError("No number in display")
        }
        if let calcMethod = sender.titleLabel?.text {
            if calcMethod == "+/-"  {
                displayLable.text = String(number * -1)
            }
            else if calcMethod == "%" {
                displayLable.text = String(number / 100)
            }
            else if calcMethod == "AC" {
                displayLable.text = "0"
            }
        }
    }
    
    
}

