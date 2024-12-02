//
//  ViewController.swift
//  [1]Calculator
//
//  Created by 김동준 on 11/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!
    let formatter = NumberFormatter()
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        formatter.numberStyle = .decimal
        numberLabel.text = "0"
    }

    func setup() {
        numberLabel.lineBreakMode = .byTruncatingHead
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let number = sender.tag - 10
                
        if numberLabel.text == "0" {
            numberLabel.text = ""
        }
        
        if result < Int.max {
            numberLabel.text = (numberLabel.text ?? "") + String(number)
            let currentText = numberLabel.text?.replacingOccurrences(of: "[.,]", with: "", options: .regularExpression) ?? ""
            
            guard let resultText = Int(currentText) else { return }
            result = resultText
            
            if let formattedString = formatter.string(from: NSNumber(value: result)) {
                
                print(result)
                
                numberLabel.text = formattedString
            }
        }
    }
}
