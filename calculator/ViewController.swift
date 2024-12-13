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
                displayLable.text?.append(numVal)
            }
        }
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        isFirstNumber = true
    }
    
    
}

